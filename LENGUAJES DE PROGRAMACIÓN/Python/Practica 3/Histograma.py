

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
            if (len == long) and long not in histogram: 
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