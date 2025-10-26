#=
Press shift-enter in each line to execute it
=#

strname::String = "Osinachi"
println(strname)

strname[2:4]

# for loop
for i=1:5
    println(i)
end

x::Int = 12 #  Define variable 'x' with type 'int'

typeof(x) # get the type of variable 'x'

"""y variable"""
y::Int = x^2

γ = 3 # \gamma 

α = 45 # \alpha 


α₀ = 11 # \alpha followed by \_0 
β² = 5  # \beta followed by  \^2 

println("y is ", y," ", γ)

π
π^2

σ = 0


"""
Add two interger numbers

# Arguments
- `x::Int64`: Any interger number
- `y::Int64`: Any interger number

# Returns
- `x + y`: an interger number
"""
function add(x::Int64, y::Int64)
    return x+y
end

add(2,4)

# Define constant variables using 'const'
const MY_PIE::Float64 = 3.14

# i:j, vector of numbers between i to j
collect(4:12)

# i:z:j, vector of numbers between i to j with step size z
collect(1:0.5:3)

# Define matrix
matt = [1 3 4.5;4 5 0.8]

# Vector of Row 2, column 2 to 3
matt[2,2:3]

# Define abstract type
abstract type BaseInterface end

# Create a class that inherits from abstract type
# mutable -> allow you to change field values (ie. assign 
# new values to a field) of struct.
# Struct is immutable by default
mutable struct SubClass <: BaseInterface
    name::String
    w::Int64
    h::Int64
end

# function of base class
function sumValue(obj::BaseInterface)
    return obj.w + obj.h
end

function (obj::BaseInterface)()
    obj.w * obj.h
end

# Create object
ob::SubClass = SubClass("rect",2,5)

ob.h
ob.w

sumValue(ob)
ob()

# Create object if type abstract class
abstob::BaseInterface = SubClass("square",6,6)

abstob.w

sumValue(abstob)

# Create a class that inherits from abstract type
mutable struct Persons <: BaseInterface
    name::String
    is_active::Bool

    # Recreates the constructor to accept less argument than
    # the defined nymber of fields. 'new' creates new constructor
    function Persons(name)
        new(name, true)
    end
end

obosi::Persons = Persons("Osinachi")

