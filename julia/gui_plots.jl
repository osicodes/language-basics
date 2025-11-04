using PlutoUI, Pkg
Pkg.add("Interact")
Pkg.add("Blink")   # optional, for nice GUI windows. Uses Electron

using Interact, Blink

@manipulate for angle in 1:1:180
    "Angle: $angle"
end
angle[]


x = Slider(1:1:180, default=80)
display(x)


w = Window()
ui = slider(1:1:180, value=80, label="Angle")
body!(w, ui)


y = 4 + ui