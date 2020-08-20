# Liquid

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/liquid-circle.gif width=140 align="right" />

#### Add a Splash to Your SwiftUI Interface

Create a subtle and playful backsplash with `Liquid()`. Try liquid behind your artwork, as a button, or even with your own shapes. Just add `Liquid()` to your view to get started!

## Contents

- [Add the Package](#package)
- [Basic Usage](#basic-usage)
- [Example](#example)
- [Credits](#credits)

## Package

### For Xcode Projects

File > Swift Packages > Add Package Dependency: https://github.com/maustinstar/liquid

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
.package(url: "https://github.com/maustinstar/liquid.git", from: "0.0.1"),
```

## Basic Usage

Just import Liquid, and add it to your View to get started.

```swift
struct ContentView: View {
    var body: some View {
        Liquid().frame(width: 200, height: 200)
    }
}
```

**See the full [Reference Guide](https://github.com/maustinstar/liquid/blob/master/Docs/Reference.md).**

## Example

#### Layered Liquid

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/liquid-circle.gif width=250 align="right" />

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Liquid()
                .frame(width: 240, height: 240)
                .foregroundColor(.blue)
                .opacity(0.3)


            Liquid()
                .frame(width: 220, height: 220)
                .foregroundColor(.blue)
                .opacity(0.6)

            Liquid(samples: 5)
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            
            Text("Liquid").font(.largeTitle).foregroundColor(.white)
        }
    }
}
```

**See more [Examples](https://github.com/maustinstar/liquid/blob/master/Docs/Examples.md).**

## Contributing

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/bezier.gif width=150 align="right" />

To get started, read the full [Implementation Guide](https://github.com/maustinstar/liquid/blob/master/Docs/Liquid%20Implementation%20Guide.md).

**See [Contributing.md](https://github.com/maustinstar/liquid/blob/master/Contributing.md).**

## 🚀 Looking for more fun SwiftUI Packages?

**Take your SwiftUI apps to the next level with these Packages!**

<a href="https://github.com/maustinstar/shiny">
  <img src="https://github-readme-stats.vercel.app/api/pin/?username=maustinstar&repo=shiny" height=130 align="left" />
</a>

<a href="https://github.com/maustinstar/swiftui-drawer">
  <img src="https://github-readme-stats.vercel.app/api/pin/?username=maustinstar&repo=swiftui-drawer" height=130 />
</a>

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/liquid-profile.gif width=140 align="right" />

## Credits

* [**Michael Verges**](https://github.com/maustinstar) - *Initial work* - mverges3@gatech.edu - [![Follow on Linkedin](https://img.shields.io/badge/Follow%20on-Linkedin-5176B1.svg)](https://www.linkedin.com/in/michaelverges)
