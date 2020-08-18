//
//  CGPath.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import CoreGraphics

extension CGPath {
    /// Iterates through path elements to extract key points.
    /// - Returns: Key CGPoints from the path
    func getPoints() -> [CGPoint] {
        var points: [CGPoint] = []
        self.applyWithBlock { (element) in
            points.append(element.pointee.points.pointee)
        }
        return points
    }
}
