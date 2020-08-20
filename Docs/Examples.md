#  Examples

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

#### Profile Icon

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/liquid-profile.gif width=250 align="right" />

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Liquid()
                .frame(width: 220, height: 220)
                .foregroundColor(.yellow)
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .mask(Liquid())
        }
    }
}
```

#### Text On Art

<img src=https://raw.githubusercontent.com/maustinstar/liquid/master/Docs/Media/liquid-art.gif width=250 align="right" />

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Liquid(samples: 3, period: 10.0)
                .frame(width: 400, height: 200)
                .foregroundColor(.yellow)
                .opacity(0.2)
                .blur(radius: 10)
            Image("pattern")
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 120)
                .mask(Liquid(samples: 3, period: 6.0))
                .shadow(radius: 40)
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
```
