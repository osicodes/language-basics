struct RGB
    r::Float64
    g::Float64
    b::Float64

    RGB(r, g, b) = new(r, g, b)
end

dotc(x::RGB, y::RGB) = 0.2*x.r*y.r + 0.771*x.g*y.g + 0.029*x.b*y.b
(z::RGB)() = z.r + z.g + z.b

color1 = RGB(20,30,155)
color2 = RGB(20,30,155)

dotc(color1, color2)

color1()