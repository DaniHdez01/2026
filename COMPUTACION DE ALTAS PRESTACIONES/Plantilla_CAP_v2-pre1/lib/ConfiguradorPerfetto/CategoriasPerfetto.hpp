#pragma once

/**
 * @file
 * @brief Definiciones de categorías de evento personalizadas de Perfetto comunes a todo el proyecto
 *
 * Este archivo de encabezado debe ser incluido en prácticamente cualquier archivo que use elementos
 * de la API de Perfetto.
 */

#include <perfetto.h>

// Definir categorías personalizadas de eventos de Perfetto
PERFETTO_DEFINE_CATEGORIES(
    perfetto::Category("init").SetDescription("Inicialización del proceso"),
    perfetto::Category("mpi").SetDescription("Interacciones mediante MPI"),
    perfetto::Category("trabajo").SetDescription("Relacionado a la ejecución de la carga de trabajo"));
