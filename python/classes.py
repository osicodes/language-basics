class Microwave:
    def __init__(self, brand: str) -> None:
        # Creates a constructor for the class
        # "-> None" means init() returns None. (like void init() in C++) 
        # It is not necessary to include it.
        self.brand = brand
        self.turned_on: bool = False
        self.is_running: bool = False
    
    def __str__(self):
        # Called by the "print" function
        return f'Microwave class'
    
    def __repr__(self):
        # Called in the "print" function - print(repr(microwave)). 
        # Returns a representation of how the class looks. Usually  for the developer.
        return f"Microwave({self.brand})"
    
    def foo(self, a: int, b: str):
        '''
        Take your arguments back, I don't want them!
                 
        Args:
            a (int): Any number
            b (str): Any string

        Returns:
            tuple: (a, b)
        '''
        return a, b
    
    def turn_on(self) -> None:
        '''Turns on the microwave'''
        if self.turned_on:
            print(f'{self.brand} is already turned on')
        else:
            self.turned_on = True
            print(f'{self.brand} is now turned on')
            
    def turn_off(self) -> None:
        '''Turns off the microwave'''
        if self.turned_on:
            self.turned_on = False
            print(f'{self.brand} is now turned off')
        else:
            print(f'{self.brand} is already turned off')
            
    def run(self, seconds: int) -> None:
        '''Runs the microwave'''
        if self.turned_on:
            if self.is_running:
                print(f'{self.brand} is already running')
            else:
                self.is_running = True
                print(f'Running {self.brand} for {seconds} seconds')
        else:
            print(f'Turn on your microwave')
            
    def stop(self) -> None:
        '''Stops the microwave'''
        if self.turned_on:
            if self.is_running:
                self.is_running = False
                print(f'{self.brand} is now stopped')
            else:
                print(f'{self.brand} is not running')
        else:
            print(f'{self.brand} microwave is turned off')


        
def main() -> None:
    '''The main function'''
    
    beko: Microwave = Microwave("Beko") 
    '''Beko microwave'''

    res = beko.foo(2,"me")

    print(beko)
    print(repr(beko))
    print(f"res tuple result {res}\n")

    beko.turn_on()
    beko.turn_off()
    beko.stop()
    beko.run(20)
    beko.turn_on()
    beko.run(20)
    beko.stop()

if __name__ == "__main__":
    main()