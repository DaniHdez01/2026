

def filter_text(input_string, condition_function):
    """
    Filtra palabras de una cadena de texto basándose en una función de condición.

    Args:
        input_string (str): La cadena de texto a filtrar.
        condition_function (function): Una función que toma una palabra como argumento
                                       y devuelve True si la palabra debe incluirse, False en caso contrario.

    Returns:
        list: Una lista de palabras que cumplen la condición.
    """
    words = input_string.split()
    filtered_words = [word for word in words if condition_function(word) == False]
    return filtered_words

def apply(condicion, texto): 
    longs = []
    i = 0
    for palabra in texto: 
        long = condicion(palabra)
        longs.append(long)
    return longs

def hist(lengths): 
    histogram = dict()
    for len in lengths:
        count = 0
        for long in lengths: 
            if (len == long): 
                count += 1
        histogram[len] = count 
    return histogram

def print_histogram(histogram): 
    keys = histogram.keys()
    for key in keys: 
        barra = ""
        for i in range(0,histogram[key]): 
            barra += "="
        print(f"{key} :{barra}")

def main():  
    text = "La asignatura es la más fácil de la titulación" 
    filtered_text = filter_text(text, lambda x: "la" in x.lower())
    print(filtered_text)
    lengths = apply(lambda x: len(x), filtered_text)
    print(lengths)
    histogram = hist(lengths)
    print(histogram)
    print_histogram(histogram)

if __name__ == "__main__": 
    main()
