using ModelingToolkit: t_nounits as t, D_nounits as D
using ModelingToolkitStandardLibrary.Blocks: Integrator, Add, Gain, Step, Constant
using OrdinaryDiffEq, Plots, ModelingToolkit
# using ModelingToolkitStandardLibrary.Electrical

# @parameters t R=10.0 C=0.1
# @variables VC(t)

## pin
@connector Pin begin
    v(t), [description = "Potential at the pin [V]"]
    i(t), [connect = Flow, description = "Current flowing into the pin [A]"]
end

## ground
@mtkmodel Ground begin
    @components begin
        g = Pin()
    end

    @equations begin
        g.v ~ 0
    end
end

## OnePort
@mtkmodel OnePort begin
    @components begin
        p = Pin()
        n = Pin()
    end

    @variables v(t), i(t)

    @equations begin
        v ~ p.v - n.v,
        i ~ p.i,
        p.i + n.i ~ 0
        # n.i ~ -i
    end
end

## Resistor
@mtkmodel Resistor begin 
    @extend OnePort() # Resistor inherits from OnePort
    @parameters begin
        R = 1.0
    end

    @equations begin
        v ~ i * R
    end
end

## Capacitor
@mtkmodel Capacitor begin 
    @extend OnePort() # Capacitor inherits from OnePort

    @parameters begin
        C = 1.0
    end

    @equations begin
        i ~ C * D(v)
    end
end

## voltage source
@mtkmodel ConstantVoltage begin
    @extend OnePort() # Capacitor inherits from OnePort
    @parameters begin
        V = 1.0
    end
    # @variables begin
    #     v_in(t)[input = true]
    # end
    # @variables v_in(t) [input = true]
    @variables v_in(t) [input = true]

    @equations begin
        # v ~ v_in #V
        # v ~ V
        v ~ v_in
    end
    # @extend ODESystem([], t, [v_in], [V]; name)
end

## Model 
@mtkmodel RCModel begin
    # @parameters begin
    #     R=10.0 
    #     C=0.1 
    #     V=1.0
    # end
    # @variables begin
    #     # V(t) = Step(start_time = 2, height = 1; name = :step) # height = 1 means input V is 1
    #     V(t) = 1.0
    # end

    @components begin
        resistor = Resistor() 
        capacitor = Capacitor() 
        source = ConstantVoltage()
        ground = Ground()
    end
    @equations begin
        # connect(V.output.u, source.v_in)
        connect(source.p, resistor.p)
        connect(resistor.n, capacitor.p)
        connect(capacitor.n, source.n, ground.g) 
        # connect(source.n, ground.g)   
    end
end

## build or compile
@mtkbuild rc_model = RCModel()  #; resistor.R = 2.0