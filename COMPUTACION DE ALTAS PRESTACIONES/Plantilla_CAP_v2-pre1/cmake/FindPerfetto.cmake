#[[
    Módulo de búsqueda de la libería Perfetto

    Este módulo descarga y añade automáticamente la librería al proyecto
    en base a las instrucciones proporcionadas por la documentación de
    Perfetto.

    Es necesario especificar una versión de Perfetto para poder utilizar este módulo:
        find_package("Perfetto" "<version>" ...)
    Por ejemplo:
        find_package("Perfetto" "53" ...)
        find_package("Perfetto" "53.0" ...)

    Objetivos de compilación declarados:
        perfetto

    Más info:
    https://perfetto.dev/docs/getting-started/in-app-tracing#setup
]]

include(FindPackageHandleStandardArgs)
include(FetchContent)

# Es necesario contar con un compilador de C++
enable_language("CXX")

# Buscar la librería de programación multi-hilo de la plataforma
find_package("Threads")

#################################################
# Descarga del SDK
#################################################

# Configurar URL de descarga y localización de los archivos del SDK
# en función de la versión de Perfetto
if(Perfetto_FIND_VERSION_MAJOR LESS_EQUAL "53")
    set(Perfetto_URL "https://github.com/google/perfetto/archive/refs/tags/v${Perfetto_FIND_VERSION_MAJOR}.${Perfetto_FIND_VERSION_MINOR}.zip")
    set(Perfetto_SDK_SUBFOLDER "/sdk")
elseif(Perfetto_FIND_VERSION_MAJOR GREATER_EQUAL "54")
    set(Perfetto_URL "https://github.com/google/perfetto/releases/download/v${Perfetto_FIND_VERSION_MAJOR}.${Perfetto_FIND_VERSION_MINOR}/perfetto-cpp-sdk-src.zip")
    set(Perfetto_SDK_SUBFOLDER "")
endif()

# Declarar Perfetto como contenido externo
# https://cmake.org/cmake/help/latest/module/FetchContent.html#command:fetchcontent_declare
# https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#find-modules
FetchContent_Declare(
    "Perfetto"
    # URL del archivo ZIP que contiene el código fuente de Perfetto correspondiente
    # con la versión pedida
    # Por cada versión, Google crea etiquetas de Git de nombre "v<VERSION_MAYOR>.<VERSION_MENOR>" (p. ej. "v53.0")
    URL "${Perfetto_URL}"
    # Hacer que la fecha de descarga y extracción coincidan para evitar errores
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)

# Hacer que el código fuente de Perfetto sea descargado durante la configuración del proyecto
# https://cmake.org/cmake/help/latest/module/FetchContent.html#command:fetchcontent_makeavailable
FetchContent_MakeAvailable("Perfetto")

# Si se ha llegado aquí, entonces no ha habido errores en la descarga
# y Perfetto ha sido encontrado
set(Perfetto_FOUND_VERSION "${Perfetto_FIND_VERSION_MAJOR}.${Perfetto_FIND_VERSION_MINOR}")

#################################################
# Importación del SDK
#################################################

# Declarar Perfetto como librería en el proyecto
add_library(perfetto STATIC
    "${perfetto_SOURCE_DIR}${Perfetto_SDK_SUBFOLDER}/perfetto.cc"
    "${perfetto_SOURCE_DIR}${Perfetto_SDK_SUBFOLDER}/perfetto.h"
)

# Añadir carpeta de archivos de encabezado
target_include_directories(perfetto PUBLIC "${perfetto_SOURCE_DIR}${Perfetto_SDK_SUBFOLDER}")

# Añadir requisito de enlazado contra la librería de programación multi-hilo
target_link_libraries(perfetto PUBLIC Threads::Threads)

# Configuración específica para Windows
if (WIN32)
    # Las opciones de compilador especificadas sólo son compatibles con MSVC
    if(MSVC)
        # The Perfetto library contains many symbols, so it needs the "big object"
        # format.
        target_compile_options(perfetto PRIVATE "/bigobj")

        # Disable legacy features in windows.h.
        add_definitions(-DWIN32_LEAN_AND_MEAN -DNOMINMAX)

        # On Windows, we need to link to the WinSock2 library.
        target_link_libraries(perfetto PUBLIC ws2_32)

        # Enable standards-compliant mode when using the Visual Studio compiler.
        target_compile_options(perfetto PUBLIC "/permissive-")
    else()
        message(FATAL_ERROR "El módulo de búsqueda de Perfetto sólo está adaptado para ser funcionar en Windows junto al MSVC")
    endif()
endif()

find_package_handle_standard_args(
    "Perfetto"
    REQUIRED_VARS perfetto_SOURCE_DIR perfetto_POPULATED
    VERSION_VAR Perfetto_FOUND_VERSION
)
