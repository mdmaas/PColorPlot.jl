# PColor.jl
Adding interpolated heatmaps to Plots.jl via a pcolor recipe

usage:

```
# This works
pcolor(x, y, data)                                  
pcolor(x, y, data, interpolate=:true)                           
pcolor(x, y, data, interpolate=:true, oversampling_factor = 5)  

pcolor(data, interpolate=:true)                     
pcolor(data, interpolate=:true, oversampling_factor=5)         


# This should plot heatmap(data), but it doesn't plot anything
pcolor(data)
```
**Example**

This is the standard heatmap
```
data = rand(15,10)
heatmap(data)
```
![pcolor_no_interp](https://github.com/mdmaas/pcolor.jl/blob/main/no_interp.png)


Using pcolor with interpolation:
```
pcolor(data, interpolate=:true, oversampling_factor=32)
```
![pcolor_no_interp](https://github.com/mdmaas/pcolor.jl/blob/main/cubic_interp.png)


**TO DO:**
- It would be nice if the oversampling factor could equal figure resolution / data resolution, so that the interpolated data has a number of pixels equal to the resolution.
- Possibly merge into Plots.jl ?
- Register package ?
