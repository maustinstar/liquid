//
//  Path.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI

extension Path {
    
    /// Creates a Bezier path through all points with consistent tangent lines
    /// - Parameter points: points to build into a path
    /// - Returns: Bezier path through all points
    @discardableResult
    mutating func smooth(_ points: [CGPoint]) -> Path {
        let controls = ControlPoints(points)
        self.move(to: points.last!)
        for i in 0..<points.count {
            self.addCurve(
                to: points[i],
                control1: CGPoint(x: controls.x1[i], y: controls.y1[i]),
                control2: CGPoint(x: controls.x2[i], y: controls.y2[i]))
        }
        return self
    }
    
    /// Creates a Bezier path through all points with consistent tangent lines
    /// - Parameter x: x-coordinates to build into a path
    /// - Parameter y: y-coordinates to build into a path
    /// - Returns: Bezier path through all points
    @discardableResult
    mutating func smooth(x: [Double], y: [Double]) -> Path {
        let controls = ControlPoints(x: x, y: y)
        move(to: CGPoint(x: x.last!, y: y.last!))
        for i in 0..<x.count {
            addCurve(
                to: CGPoint(x: x[i], y: y[i]),
                control1: CGPoint(x: controls.x1[i], y: controls.y1[i]),
                control2: CGPoint(x: controls.x2[i], y: controls.y2[i]))
        }
        return self
    }
}
