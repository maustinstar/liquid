//
//  LiquidCircle.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI

struct LiquidCircle: Shape {
    
    var radians: AnimatableArray

    var animatableData: AnimatableArray {
        get { radians }
        set { radians = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let points = self.points(in: rect)
            path.smooth(x: points.x, y: points.y)
        }
    }
    
    func points(in rect: CGRect) -> (x: [Double], y: [Double]) {
        var x: [Double] = []
        var y: [Double] = []
        x.reserveCapacity(radians.values.count)
        y.reserveCapacity(radians.values.count)
        let width = Double(rect.width)
        let height = Double(rect.height)
        let offset = (x: Double(rect.midX), y: Double(rect.midY))
        for i in 0..<radians.values.count {
            x.append(offset.x + cos(radians.values[i]) * width / 2)
            y.append(offset.y + sin(radians.values[i]) * height / 2)
        }
        return (x, y)
    }
}
