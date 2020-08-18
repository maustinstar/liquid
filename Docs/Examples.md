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
