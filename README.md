# pcolorplot.jl
Adding interpolated heatmaps to Plots.jl via a pcolor recipe

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

![pcolor](https://github.com/mdmaas/pcolorplot.jl/assets/6352520/aa1b1204-350b-4a16-aa6b-9183af68e5fa)


This repo is a work in progress.

TO DO:
- Implement simple 2d cubic splines relying on the 1d case in DataInterpolations.jl, as that package seems better supported than Interpolations.jl, which doesn't have 2d splines anyway.
- Possibly merge into Plots.jl
- Register package ?
