# Reference

Usage details for `Liquid`

## Contents
- [Basic Usage](#usage)
- [Circles](#gradients)
- [Custom Paths](#custom-paths)

    
## Usage

Just import Liquid, and add it to your View to get started.

```swift
Import Liquid
...
struct ContentView: View {
    var body: some View {
        Liquid().frame(width: 200, height: 200)
    }
}
```

## Circles

####  `Liquid(samples: Int = 8, period: TimeInterval = 6)`

Renders a circular Liquid view.

**`samples`** - The number of anchor points along the circle's path, selected each period. Arcs are rendered between anchor points. With more samples, the shape looks more circular. With less samples, the shape looks more abstract.

**`period`** - The duration between resampling. Longer periods appear to be slower and smooth.

## Custom Paths

####  `Liquid(_ path: CGPath, interpolate: Int, samples: Int, period: TimeInterval = 6)`

Renders a Liquid view from a custom path.

**`path`** - The source path to construct anchor points.

**`interpolate`** - Number of points along the path to up-sample. Interpolation is important in adding definition to paths. For paths with low definition (for example, 10 points), should be up-sampled to 100 points. This increases anchor point candidates for each period.

**`samples`** - The number of anchor points along the path, selected each period. Arcs are rendered between anchor points. With more samples, the shape looks more like the original path. With less samples, the shape looks more abstract.

**`period`** - The duration between resampling. Longer periods appear to be slower and smooth.

## Examples

**See [Examples](https://github.com/maustinstar/liquid/blob/master/Docs/Examples.md).**
