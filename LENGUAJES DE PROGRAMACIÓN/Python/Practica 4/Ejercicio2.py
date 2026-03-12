
def letters(c): 
    char_code = ord(c.lower())
    for char_code in range(ord('a'), char_code): 
        yield chr(char_code)

def main(): 
    for letter in letters('F'): 
        print(letter)

main()