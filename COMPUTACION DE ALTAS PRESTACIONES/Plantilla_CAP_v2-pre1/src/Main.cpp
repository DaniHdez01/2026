// Archivo de encabezado para la librería de MPI
#include <mpi.h>

// Incluir clase de ayuda para la configuración de Perfetto
#include <ConfiguradorPerfetto.hpp>

// Incluir definiciones de categorías de eventos
// NECESARIO PARA CUALQUIER ARCHIVO EN EL QUE SE VAYA A USAR PERFETTO
#include <CategoriasPerfetto.hpp>

// Archivo de encabezado para NVTX (puede ser utilizado tanto en
// archivos de código fuente de C++ como CUDA)
#include <nvtx3/nvtx3.hpp>

// Sólo necesario para el código de ejemplo
#include <thread>
#include <vector>

int main(int argc, char** argv) {
    // Inicializar MPI
    MPI_Init(NULL, NULL);

    // Obtener el rango MPI del proceso actual
    int mpi_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &mpi_rank);

    /*
        Inicializar la funcionalidad de trazado mediante Perfetto

        Esto debe ser realizado después de llamar a MPI_Init()
        porque sino no funciona.
    */

    // Cambiar nombre de la pista de Perfetto que representa al proceso
    // en función del rango MPI asignado
    std::string nombre_pista_proceso;
    // Si el proceso tiene asignado el MPI rank 0
    if (mpi_rank == 0) {
        // Asumir que se trata del gestor
        nombre_pista_proceso = "Gestor";
    } else {
        // Asumir que se trata de un trabajador
        nombre_pista_proceso = "Trabajador " + std::to_string(mpi_rank);
    }

    // Configurar Perfetto
    ConfiguradorPerfetto::configurar_perfetto(nombre_pista_proceso);

    /*
        A partir de aquí empieza la lógica habitual de la aplicación.

        Ya se pueden utilizar las distintas funciones de
        la API de Perfetto para trazar la ejecución del programa.
    */

    // Prueba a depurar con CUDA-GDB y a consultar el contenido de la lista
    std::vector<int> lista(10);

    if (mpi_rank == 0) {
        TRACE_EVENT_INSTANT("init", "Hacer algo que no tiene duración");
        nvtx3::mark("Hacer algo que no tiene duración");

        TRACE_EVENT_BEGIN("trabajo", "Hacer algo que tarda un tiempo");
        nvtxRangePushA("Hacer algo que tarda un tiempo");

        // Dormir por 1 segundo, 20 veces
        for (int i = 0; i < 20; i++) {
            TRACE_EVENT("trabajo", perfetto::DynamicString{"Hacer algo que tarda un tiempo (iteración " +
                                                           std::to_string(i) + ")"});
            nvtx3::scoped_range r{"Hacer algo que tarda un tiempo (iteración " + std::to_string(i) + ")"};

            std::this_thread::sleep_for(std::chrono::seconds(1));
        }

        TRACE_EVENT_END("trabajo");
        nvtxRangePop();
    } else {
        TRACE_EVENT("trabajo", "Hacer algo muy importante");
        nvtx3::scoped_range r{"Hacer algo muy importante"};

        std::this_thread::sleep_for(std::chrono::seconds(5));
    }

    MPI_Finalize();
    return 0;
}
