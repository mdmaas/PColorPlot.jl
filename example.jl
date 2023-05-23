using Revise
using Plots, PColor

x = -cos.(LinRange(0,π,55))
y = -cos.(LinRange(0,π/2,80))
data = Array{Float64}(undef, length(y), length(x))
for (iy,yv) ∈ enumerate(y), (ix,xv) ∈ enumerate(x)
    data[iy,ix] = xv*yv^2
end


# This works
pcolor(x, y, data)                                  # No interpolation
pcolor(x, y, data, interpolate=:true)               # Interpolate x, y, data
pcolor(x, y, data, interpolate=:true, ifactor=5)    # Same as before, with custom oversampling factor

pcolor(data, interpolate=:true)                     # Interpolate 1:size(data,1), 1:size(data,2), data
pcolor(data, interpolate=:true, ifactor=5)          # Same as before, with custom oversampling factor


# This should be heatmap(data), but it doesn't plot anything
pcolor(data)