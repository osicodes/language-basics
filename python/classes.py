class Microwave:
    def __init__(self, name: str):
        self.name = name
    
    def __str__(self):
        return f'Microwave class'
    
    def __repr__(self):
        return f"Microwave({self.name})"
    
beko: Microwave = Microwave("Beko")

print(beko)
print(repr(beko))