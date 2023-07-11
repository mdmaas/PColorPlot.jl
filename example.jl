using Revise
using Plots, PColorPlot

x = -cos.(LinRange(0,π,55))
y = -cos.(LinRange(0,π/2,80))
data = Array{Float64}(undef, length(y), length(x))
for (iy,yv) ∈ enumerate(y), (ix,xv) ∈ enumerate(x)
    data[iy,ix] = xv*yv^2
end


# This works
pcolor(x, y, data)
pcolor(x, y, data, interpolate=:true)
pcolor(data, interpolate=:true)
pcolor(data)


rand_data = rand(15,10)
h1 = heatmap(rand_data)
h2 = pcolor(rand_data, interpolate=:true)
plot(h1, h2, layout=(2,1))


