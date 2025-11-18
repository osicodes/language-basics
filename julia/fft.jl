using FFTW, Plots


# Create a time signal
Fs = 20            # Sampling frequency (Hz)
T = 1 / Fs            # Sampling period
t = 0:T:2-T            # 1 second duration
f = 2              # Frequency (Hz)

x = 5*cos.(2π * f .* t)  # Sine wave
plot(t,x)


# Discrete plot
n=0:Fs - 1
nx = 5*cos.(2π * f .* n .* T)
plot(n,nx, seriestype=:stem, marker=:circle, title="Discrete Signal", xlabel="n", ylabel="Amplitude")

# ----------------
# DFT
k=2
N = length(nx)
kx = nx .* exp.(2im * pi * k * n ./ N)

# real(kx) shows us how well our result correlates with our 
# cosine wave at a particular k value
plot!(n,real.(kx), marker=:circle, ylabel="kx")
# imag(kx) shows us how well our result correlates with our 
# sine wave at a particular k value
plot!(n,imag.(kx), marker=:circle, ylabel="kx")
plot!([k],[abs(sum(kx))], seriestype=:stem, marker=:circle, color=:yellow, ylabel="magnitude")
plot([k],[angle(sum(kx))], seriestype=:stem, marker=:circle, color=:green, ylabel="phase angle of the sum")
plot!([k],[abs(sum(kx))/Fs*2], seriestype=:stem, marker=:circle, color=:yellow, ylabel="Amplitude")

# FFT
kn = n
expM = [exp.(2im * pi * k * n ./ N) for k in kn]
M = hcat(expM...)
# x_k = nx .* expM
x_k = M * nx
scatter(kn,abs.(x_k), marker=:circle, title="fft", xlabel="k", ylabel="magnitude", legend=:outertop)
scatter(kn,abs.(x_k)./Fs*2, marker=:circle, title="fft", xlabel="k", ylabel="Amplitude", legend=:outertop)

# ----------------




# Compute FFT
X = fft(x)

# Compute magnitude spectrum
nl = length(x)
freq = Fs * (0:(nl-1)) ./ nl
magnitude = abs.(X) ./ nl

# Plot
scatter(freq[1:div(nl,2)], magnitude[1:div(nl,2)]*2, xlabel="Frequency (Hz)", ylabel="Amplitude", title="FFT Spectrum")
