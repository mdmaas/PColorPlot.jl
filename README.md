# PColor.jl
Adding interpolated heatmaps to Plots.jl via a pcolor recipe

**This is a work in progress**.

So far, linear interpolation is implemented via Interpolations.jl. 

`x` and `y` can be arbitrary grids.

usage:

```
x = LinRange(0,1,15).^2
y = LinRange(0,1,20)
data = rand(15, 20)


pcolor(x, y, data, interp=:linear)
pcolor(data, interp=:linear)
pcolor(data, interp=:linear, ifactor=5)
pcolor(x, y, data)
```
![pcolor_no_interp](https://github.com/mdmaas/pcolorplot.jl/assets/6352520/d02a5558-5487-4968-aaf0-37870a2bb473)

![pcolor_linear_interp](https://github.com/mdmaas/pcolorplot.jl/assets/6352520/c73483b6-d4d4-4c55-bd1d-41db6c10ae9f)

**TO DO:**
- Implement simple 2d cubic splines relying on the 1d case in DataInterpolations.jl, as that package seems better supported than Interpolations.jl, which doesn't have 2d splines anyway.
- Possibly merge into Plots.jl ?
- Register package ?
