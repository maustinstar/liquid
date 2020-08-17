//
//  CGPath.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import CoreGraphics

extension CGPath {
    func getPoints() -> [CGPoint] {
        var points: [CGPoint] = []
        self.applyWithBlock { (element) in
            points.append(element.pointee.points.pointee)
        }
        return points
    }
}
