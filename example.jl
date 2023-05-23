using Revise
using Plots, PColor

x = -cos.(LinRange(0,π,55))
y = -cos.(LinRange(0,π/2,80))
data = Array{Float64}(undef, length(y), length(x))
for (iy,yv) ∈ enumerate(y), (ix,xv) ∈ enumerate(x)
    data[iy,ix] = xv*yv^2
end


# This works
pcolor(x, y, data)                                  
pcolor(x, y, data, interpolate=:true)                           
pcolor(x, y, data, interpolate=:true, oversampling_factor = 5)  

pcolor(data, interpolate=:true)                     
pcolor(data, interpolate=:true, oversampling_factor=5)         


# This should plot heatmap(data), but it doesn't plot anything
pcolor(data)



data = rand(15,10)
heatmap(data)
pcolor(data, interpolate=:true, oversampling_factor=32)


