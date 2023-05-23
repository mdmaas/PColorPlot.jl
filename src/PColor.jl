module PColor

using Plots
using Dierckx

function cubic_interp_2d( x, y, data, oversampling_factor )

    spl = Spline2D(y, x, data; kx=3, ky=3, s=0.0)
    
    nx_fine = length(x) * oversampling_factor
    ny_fine = length(y) * oversampling_factor

    finerx = LinRange(x[1], x[end], nx_fine)
    finery = LinRange(y[1], y[end], ny_fine)

    data_interp = Array{Float64}(undef, ny_fine, nx_fine)

    for (i,yint) ∈ enumerate(finery), (j,xint) ∈ enumerate(finerx)

        data_interp[i,j] = evaluate(spl, yint, xint)

    end

    return finerx, finery, data_interp
    
end

@userplot pcolor
@recipe function f(h::pcolor; interpolate = :none, oversampling_factor = 8)
    if length(h.args) == 3
        x, y, z  = h.args
    elseif length(h.args) == 1
        z = h.args[1]
        x = 1:size(z,2)
        y = 1:size(z,1)
    end
    @series begin
        seriestype := :heatmap
        if interpolate == :true
            x, y, z = cubic_interp_2d( x, y, z, oversampling_factor )
        else
            x, y, z
        end
    end
end

end
