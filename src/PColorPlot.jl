module PColorPlot

using Plots
using Dierckx

function cubic_interp_2d( x, y, data, s )

    spl = Spline2D(y, x, data; kx=3, ky=3, s=0.0)
    
    finerx = LinRange(x[1], x[end], s[1])
    finery = LinRange(y[1], y[end], s[2])

    data_interp = Array{Float64}(undef, s[2], s[1])

    for (i,yint) ∈ enumerate(finery), (j,xint) ∈ enumerate(finerx)

        data_interp[i,j] = evaluate(spl, yint, xint)

    end

    return finerx, finery, data_interp
    
end

@userplot PColor
@recipe function f(h::PColor; interpolate = false)
    
    if length(h.args) == 3
        println("3 args")
        x, y, z  = h.args
    elseif length(h.args) == 1
        println("1 args")
        z = h.args[1]
        x = 1:size(z,2)
        y = 1:size(z,1)
    end
    


    @series begin
        seriestype := :heatmap
        if interpolate
            s = plotattributes[:plot_object].attr[:size]
            x, y, z = cubic_interp_2d( x, y, z, s )
        else
            x := x
            y := y
            z := z
        end

    end
    
end


end
