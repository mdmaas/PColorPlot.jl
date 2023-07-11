# PColor.jl
Adding interpolated heatmaps to Plots.jl via a pcolor recipe

usage:

```
# All this works now
pcolor(x, y, data)
pcolor(x, y, data, interpolate=:true)
pcolor(data, interpolate=:true)
pcolor(data)
```
**Example**

This is the standard heatmap
```
data = rand(15,10)
heatmap(data)
```
![pcolor_no_interp](https://github.com/mdmaas/pcolor.jl/blob/main/no_interp.png)


Plotting the same data, using pcolor with interpolation:
```
pcolor(data, interpolate=:true)
```
![pcolor_with_interp](https://github.com/mdmaas/pcolor.jl/blob/main/cubic_interp.png)


**TO DO:**

- Currently we interpolate the data to the size of the whole figure, not just the plotarea, including axis, labels, more subplots if this is a layout, etc. This is slightly inefficient and should be fixed in the future, however I don't know how to do it, sice the when plot recipe gets called I believe it doesn't have access to the layout information.
- Either register package or merge into Plots.jl ?