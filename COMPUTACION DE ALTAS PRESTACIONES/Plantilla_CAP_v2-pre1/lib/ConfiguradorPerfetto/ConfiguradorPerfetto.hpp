#pragma once

/**
 * @file
 * @brief Declaración de la clase ConfiguradorPerfetto
 *
 * En un principio, este archivo no hace falta tocarlo para nada y sólo hace falta incluirlo
 * en el mismo archivo de código fuente que la función `main()` del programa para ser
 * utilizada por ella.
 */

#include <chrono>

#include <perfetto.h>

/**
 * @brief Clase con funciones estáticas para hacer más fácil la configuración de Perfetto
 */
class ConfiguradorPerfetto {
  public:
    /**
     * @brief Inicializar la API de Perfetto
     *
     * @param nombre_pista Nombre que debe tener la pista de trazas que representa al proceso en la traza de Perfetto
     * @param tamano_mem_comp Tamaño en kilobytes de la región de memoria compartida con el proceso de recolección de
     * trazas. Este debe ser un múltiplo de 4 y su valor máximo es 32000. Si en algún punto de la ejecución del programa
     * se declaran muchos eventos en un margen de tiempo y algunos de estos eventos no son registrados por el
     * recolector de trazas, conviene aumentar este valor.
     * @param tiempo_espera Tiempo en mili-segundos a esperar para intentar asegurar que todos los eventos sean
     * capturados. Si hay eventos declarados al principio de la ejecución del programa que no aparecen en la traza,
     * conviene aumentar este valor.
     */
    static void configurar_perfetto(std::string nombre_pista = "", uint32_t tamano_mem_comp = 256,
                                    std::chrono::milliseconds tiempo_espera = std::chrono::milliseconds(100));

  private:
    /**
     * @brief Cambiar el nombre de la pista de eventos de Perfetto asociada al proceso
     *
     * En Perfetto, a cada proceso se le asigna una pista de eventos que refleja todos
     * los eventos reportados por un mismo proceso. El nombre que tiene esta pista por defecto
     * es la cadena de argumentos utilizada para invocar el proceso, lo cual no ayuda a
     * distinguir entre procesos cuando se invocan mediante mpiexec.
     *
     * Esta función, como cualquier cambio a la descripción de una pista, debe ejecutarse
     * ANTES de registrar el proceso como una fuente de eventos utilizando `perfetto::TrackEvent::Register()`.
     * Si esto no se cumple, el cambio no será efectivo.
     *
     * @param nuevo_nombre Nuevo nombre a utilizar para la pista de eventos del proceso
     */
    static void cambiar_nombre_pista_proceso_perfetto(std::string nuevo_nombre);

    /**
     * @brief Configurar una sesión de trazado de Perfetto provisional dentro del proceso
     *
     * Esto es necesario si se quiere garantizar que todos los eventos de una aplicación
     * sean capturados, ya que si en el tiempo en el que Perfetto se conecta al servicio
     * de trazado se declara un evento, dicho evento no será capturado por el servicio de
     * trazado.
     *
     * @param tiempo_ms Tiempo (mili-segundos) que debe durar la sesión provisional antes de terminar
     */
    static void configurar_sesion_provisional(uint32_t tiempo_ms = 10000);
};
