#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <cstdio>
#include <time.h> // Para time()

#define PI 3.141582f

struct point2D {

    float x;
    float y;
};

point2D getRandomPoint(float x0, float y0,float maxRadius, float minRadius = 0.0f )
{
    point2D p;
    float r = minRadius + (maxRadius-minRadius) * (float)rand() / RAND_MAX;
    float alpha = 2.0f*PI* (float)rand() / RAND_MAX;
    p.x = x0 + r * cos(alpha);
    p.y = y0 + r * sin(alpha);
    return p;
};

point2D devolverCentroide(std::vector<point2D> data, int nPuntos){
    float xMedio = 0.0;
    float yMedio = 0.0; 
    for (int i = 0; i< nPuntos; i++){
        xMedio = xMedio + data[i].x; 
        yMedio = yMedio + data[i].y; 
    } 
    point2D centroideNuevo; 
    centroideNuevo.x = xMedio / (float) nPuntos; 
    centroideNuevo.y = yMedio / (float) nPuntos; 
    printf("Centroide calculado: %f , %f", centroideNuevo.x, centroideNuevo.y);
    return centroideNuevo; 
    //Para cada punto devolver el centroide más cercano y asignarlo al que le toque 
}

int main()
{
    srand(time(NULL)); // Inicializa la semilla para los números aleatorios

    int nClusters = 4;
    int nPointsPerCluster = 50;

    std::vector<point2D> data;
    std::vector<point2D> finalCentroids; // Vector para almacenar los centroides finales de cada clúster

    // CREACIÓN DE PUNTOS
    for (int i = 0; i < nClusters; i++)
    {
        point2D currentCentroid = getRandomPoint(0.0f, 0.0f, 20.0, 0.0); // Centroide inicial aleatorio
        printf("Centroide inicial aleatorio para clúster %d: %f, %f \n", i, currentCentroid.x, currentCentroid.y);
        
        // Generar un primer conjunto de puntos alrededor del centroide inicial
        std::vector<point2D> grupoDeCentroide;
        for (int j = 0; j < nPointsPerCluster; j++){
            point2D newPoint = getRandomPoint(currentCentroid.x, currentCentroid.y, 1.0f);
            grupoDeCentroide.push_back(newPoint);
            // Opcional: imprimir estos puntos iniciales si se desea
            // std::cout << newPoint.x << "\t" << newPoint.y << "\n";
        }
        
        // Calcular el "centroide nuevo" a partir de los puntos generados
        currentCentroid = devolverCentroide(grupoDeCentroide, nPointsPerCluster);
        printf(" (refinado para clúster %d)\n", i); // Añadir contexto al print del centroide calculado
        finalCentroids.push_back(currentCentroid); // Almacenar el centroide refinado
        // Limpiar el grupo y regenerar los puntos usando el centroide refinado
        grupoDeCentroide.clear(); 
        for (int j = 0; j < nPointsPerCluster; j++){
            point2D newPoint = getRandomPoint(currentCentroid.x, currentCentroid.y, 1.0f); // Usar el centroide refinado
            grupoDeCentroide.push_back(newPoint);
            std::cout << newPoint.x << "\t" << newPoint.y << "\n"; // Imprimir los puntos finales
        }
        data.insert(data.end(), grupoDeCentroide.begin(), grupoDeCentroide.end());
    }

    // CREACIÓN DE FICHERO DE SALIDA
    FILE* resultsFile = fopen("salida", "wb");
    if (resultsFile == NULL) {
        perror("Error al abrir el archivo salida");
        return 1; // Indicar un error
    }
    int nFilas = nClusters * nPointsPerCluster;
    int nCol = 2;
    fwrite(&nFilas, sizeof(int), 1, resultsFile);
    fwrite(&nCol, sizeof(int), 1, resultsFile);
    // Ahora 'data' está poblado correctamente
    fwrite(data.data(), sizeof(point2D), data.size(), resultsFile);
    fclose(resultsFile);
    for (int i = 0; i < data.size(); i++)
        std::cout << data[i].x << "\t" << data[i].y << "\n";

    std::cout << "\n--- Centroides finales calculados ---\n";
   // for (int i = 0; i < finalCentroids.size(); ++i) {
        //std::cout << "Centroide " << i << ": " << finalCentroids[i].x << "\t" << finalCentroids[i].y << "\n";
    ///}

    return 0; // Indicar ejecución exitosa
}