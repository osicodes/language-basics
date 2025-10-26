"""
Constructs a Microwave class

# Parameters
- `brand::String`: Brand name
- `turned_on::Bool`: Is Microwave turned on
- `is_running::Bool`: Is Microwave running
"""
mutable struct Microwave
    brand::String
    turned_on::Bool
    is_running::Bool

    function Microwave(brand, turned_on=false,is_running=false)
        new(brand, turned_on, is_running)
    end
end

"""
Turns on the microwave
"""
function turn_on(obj::Microwave)
    if obj.turned_on
        println(obj.brand," is already turned on")
    else
        obj.turned_on = true
        println(obj.brand," is now turned on")
    end
end   

"""
Turns off the microwave
"""
function turn_off(obj::Microwave)
    if obj.turned_on
        obj.turned_on = false
        println(obj.brand," is now turned off")
    else
        println(obj.brand, " is already turned off")
    end
end

"""
Runs the microwave
"""
function run_microwave(obj::Microwave, seconds::Int64)
    if obj.turned_on
        if obj.is_running
            println(obj.brand, " is already running")
        else
            obj.is_running = true
            println("Running ", obj.brand, " for ", seconds, " seconds")
        end
    else
        println("Turn on your microwave")
    end
end

"""
Stops the microwave
"""
function stop_microwave(obj::Microwave)
    if obj.turned_on
        if obj.is_running
            obj.is_running = false
            println(obj.brand, " is now stopped")
        else
            println(obj.brand, " is not running")
        end
    else
        println(obj.brand, " microwave is turned off")
    end
end










# ---------------------------------------------


function main()
    beko::Microwave = Microwave("Beko") 

    println(beko)
    turn_on(beko)
    turn_off(beko)
    run_microwave(beko,20)
    turn_on(beko)
    run_microwave(beko,20)
    stop_microwave(beko)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end