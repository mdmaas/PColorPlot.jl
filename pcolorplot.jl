using Plots
using Interpolations

function linear_interp_2d( x, y, data, ifactor )

    IC = LinearInterpolation((x, y), data)
    
    nx_fine = length(x) * ifactor
    ny_fine = length(y) * ifactor
    finerx = LinRange(x[1], x[end], nx_fine)
    finery = LinRange(y[1], y[end], ny_fine)

    data_interp = Array{Float64}(undef,nx_fine,ny_fine)
    for (i,xint) ∈ enumerate(finerx), (j,yint) ∈ enumerate(finery)
        data_interp[i,j] = IC(xint,yint)
    end

    return finery, finerx, data_interp
    
end

@userplot pcolor
@recipe function f(h::pcolor; interp = :none, ifactor = 8)
    if length(h.args) == 1
        z = h.args[1]
        x = 1:size(z,1)
        y = 1:size(z,2)
    elseif length(h.args) == 3
        x, y, z  = h.args
    end
    @series begin
        seriestype := :heatmap
        if interp == :linear
            x, y, z = linear_interp_2d( x, y, z, ifactor )
        else
            # No valid interpolation detected
            return x, y, z
        end
    end
end

x = LinRange(0,1,15).^2
y = LinRange(0,1,20)
data = rand(15, 20)

# This works
pcolor(x, y, data, interp=:linear)
pcolor(data, interp=:linear)
pcolor(data, interp=:linear, ifactor=5)
pcolor(x, y, data)
