/**
 * @file
 * @brief Definición de la clase ConfiguradorPerfetto
 *
 * En un principio, este archivo no hace falta tocarlo para nada.
 */

#include <ConfiguradorPerfetto.hpp>

#include <thread>

// Para llamar a funciones de perfetto::TrackEvent es necesario haber definido categorías de evento de pista
#include <CategoriasPerfetto.hpp>

/**
 * @brief Habilitar el almacenamiento estático de las categorías de eventos de Perfetto
 *
 * ESTA MACRO DEL PRE-PROCESADOR DEBE SER UTILIZADA UNA ÚNICA VEZ EN EL MISMO PRODUCTO
 * DEL PROCESO DE COMPILACIÓN (EJECUTABLE O LIBRERÍA). Si se usa más de una vez, el
 * enlazador devolverá un error reportando que hay símbolos con más de una definición.
 */
PERFETTO_TRACK_EVENT_STATIC_STORAGE();

void ConfiguradorPerfetto::configurar_perfetto(std::string nombre_pista, uint32_t tamano_mem_comp,
                                               std::chrono::milliseconds tiempo_espera) {
    // Crear lista de argumentos de inicialización de Perfetto
    perfetto::TracingInitArgs args;

    // Configurar la librería de Perfetto para que se conecte al servicio
    // de trazado de Perfetto a nivel de sistema (traced/tracebox)
    // De esta manera se pueden recoger los registros de trazado incluso
    // cuando la aplicación ha crasheado
    args.backends |= perfetto::kSystemBackend;

    /*
        En caso de que nuestro programa declare muchos eventos en un margen de tiempo,
        es posible que esto supere la cantidad de eventos que la librería de Perfetto
        puede poner en cola para ser procesados, por lo que la cola se satura y se pueden
        llegar a perder eventos.

        Para ello, se le puede indicar a Perfetto el tamaño del buffer de memoria compartida
        con el recolector de trazas para hacerlo más grande con respecto al tamaño por defecto
        y de esa manera evitar que la cola de eventos se sature.
    */
    args.shmem_size_hint_kb = tamano_mem_comp;

    // Inicializar la API de Perfetto conforme a lo configurado
    perfetto::Tracing::Initialize(args);

    /*
        Ahora, vamos a mejorar la representación del proceso en el registro
        de eventos de Perfetto en función del rango asignado por MPI.

        Esto debe ser realizado antes de registrar al proceso como fuente
        de eventos de Perfetto o no surtirá efecto.
    */

    // Si se ha especificado un nombre de pista
    if (nombre_pista != "") {
        cambiar_nombre_pista_proceso_perfetto(nombre_pista);
    }

    // Registrar la pista de eventos del proceso como una fuente de datos de Perfetto
    perfetto::TrackEvent::Register();

    /*
        Ahora toca paliar el hecho de que Perfetto no permite esperar al
        establecimiento de la conexión con una sesión de trazado iniciado
        por el servicio de tazado.
        https://issues.chromium.org/issues/436186464#comment3

        Cuando se crea una sesión de la recolección de trazas en el propio proceso
        utilizando `perfetto::Tracing::NewTrace()` se puede utilizar
        `perfetto::TracingSession::StartBlocking()` para bloquear
        el programa hasta que se haya iniciado la sesión correctamente y
        de esa manera asegurar que todos los eventos a capturar sean
        registrados correctamente.

        Sin embargo, cuando se depende de una sesión de traza gestionada
        externamente no es posible asegurar completamente que el programa
        haya establecido una conexión con el servicio de trazado antes
        de que se declare el primer evento a registrar. Debido a esto,
        se puede dar lugar a que algunos eventos no sean registrados en el
        programa, especialmente aquellos marcados poco después del inicio
        del programa.
    */

    // Opción A:
    // Configurar una sesión de trazado provisional dentro del proceso
    // para asegurar que todos los eventos de Perfetto son capturados
    //
    // Al hacer esto con más de 4 procesos MPI junto con la sesión
    // ya iniciada por el servicio de recolección de trazas se llega
    // al máximo de 5 sesiones por usuario impuesto por el servicio
    // de recolección de trazas
    // https://perfetto.dev/docs/concepts/concurrent-tracing-sessions#various-limits
    // https://cs.android.com/android/platform/superproject/main/+/main:external/perfetto/src/tracing/service/tracing_service_impl.cc;l=115;drc=17d5806d458e214bdb829deeeb08b098c2b5254d
    // configurar_sesion_provisional();

    // Opción B:
    // En su lugar, pausamos la ejecución durante un corto lapso de tiempo
    // No hay otra alternativa mejor debido a que Perfetto no ofrece una manera
    // de esperar al establecimiento de conexión con una sesión de trazado
    // que el propio programa no controla
    std::this_thread::sleep_for(tiempo_espera);
};

void ConfiguradorPerfetto::cambiar_nombre_pista_proceso_perfetto(std::string nuevo_nombre) {
    // Obtener la descripción de la pista de eventos asociada al proceso
    auto pdesc = perfetto::ProcessTrack::Current().Serialize();

    // Cambiar el nombre de la pista
    pdesc.mutable_process()->set_process_name(nuevo_nombre);

    // Actualizar la descripción de la pista del proceso con la nueva descripción
    perfetto::TrackEvent::SetTrackDescriptor(perfetto::ProcessTrack::Current(), pdesc);
};

void ConfiguradorPerfetto::configurar_sesion_provisional(uint32_t tiempo_ms) {
    // Configuración de la sesión provisional
    perfetto::TraceConfig cfg;

    // Configurar un buffer para captar los eventos
    cfg.add_buffers()->set_size_kb(1024);

    // Si se ha especificado un límite de tiempo para la sesión
    // provisional
    if (tiempo_ms > 0) {
        // Limitar la duración de la sesión
        cfg.set_duration_ms(tiempo_ms);
    }

    // Configurar las fuentes de eventos a considerar para la traza
    // Es conveniente que se configuren las mismas fuentes que en
    // el archivo de configuración utilizado para iniciar el servicio
    // de Perfetto, aunque no es estrictamente necesario
    auto* ds_cfg = cfg.add_data_sources()->mutable_config();

    // Configurar los eventos de trazado de Perfetto como una fuente para la traza
    ds_cfg->set_name("track_event");

    // Crear la sesión y bloquear la ejecución del programa hasta que esta
    // haya sido iniciada
    std::unique_ptr<perfetto::TracingSession> tracing_session =
        perfetto::Tracing::NewTrace(perfetto::kInProcessBackend);
    tracing_session->Setup(cfg);
    tracing_session->StartBlocking();
};