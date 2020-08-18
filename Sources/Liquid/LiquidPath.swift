//
//  LiquidPath.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI

struct LiquidPath: Shape {
    
    var x: AnimatableArray
    var y: AnimatableArray
    
    var animatableData: AnimatablePair<AnimatableArray, AnimatableArray> {
        get { AnimatablePair(x, y) }
        set {
            x = newValue.first
            y = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { (path) in
            path.smooth(x: x.values, y: y.values)
        }
    }
}
