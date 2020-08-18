//
//  ControlPoints.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import CoreGraphics
import CLiquid

/// Calculates tangents and generates Bezier control points.
struct ControlPoints {
    
    var x1: [Double]
    var y1: [Double]
    var x2: [Double]
    var y2: [Double]
    
    init(x: [Double], y: [Double]) {
        assert(
            x.count == y.count,
            "Expected matching pairs for x and y, but found "
            + "\(x.count) x points and \(y.count) y points")
        let count = x.count
        var x1: [Double] = [Double](repeating: 0, count: count)
        var y1: [Double] = [Double](repeating: 0, count: count)
        var x2: [Double] = [Double](repeating: 0, count: count)
        var y2: [Double] = [Double](repeating: 0, count: count)
        bezier_ctrl(Int32(count), x, y, &x1, &y1, &x2, &y2)
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
    }
    
    init(_ points: [CGPoint]) {
        let count = points.count
        let x = points.map { Double($0.x) }
        let y = points.map { Double($0.y) }
        var x1: [Double] = [Double](repeating: 0, count: count)
        var y1: [Double] = [Double](repeating: 0, count: count)
        var x2: [Double] = [Double](repeating: 0, count: count)
        var y2: [Double] = [Double](repeating: 0, count: count)
        bezier_ctrl(Int32(count), x, y, &x1, &y1, &x2, &y2)
        self.x1 = x1
        self.y1 = y1
        self.x2 = x1
        self.y2 = y1
    }
}
