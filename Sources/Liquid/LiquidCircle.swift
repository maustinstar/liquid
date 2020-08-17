//
//  LiquidCircle.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI

struct LiquidCircle: LiquidShape {
    
    struct Model: LiquidModel {
        var radians: AnimatableArray
    }
    static func generate(from model: Model) -> Model {
        let radians = generateRadians(model.radians.values.count)
        return Model(radians: AnimatableArray(radians))
    }
    init(_ model: Model) {
        self.radians = model.radians
    }
    
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
    
    static func generateRadians(_ count: Int) -> [Double] {
        var results: [Double] = []
        for i in 0..<count {
            let min = Double(i) / Double(count) * 2 * .pi
            let max = Double(i + 1) / Double(count) * 2 * .pi
            results.append(Double.random(in: min...max))
        }
        
        let offset = Double.random(in: 0...(.pi))
        return results.map { $0 + offset }
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
