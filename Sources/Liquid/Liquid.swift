//
//  Liquid.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI
import Combine

public struct Liquid: View {
    
    var content: AnyView
    
    public init(samples: Int = 8, period: TimeInterval = 6) {
        self.content = AnyView(LiquidCircleView(samples: samples, period: period))
    }
    
    public init(_ path: CGPath, interpolate: Int, samples: Int, period: TimeInterval = 6) {
        assert(interpolate > samples)
        self.content = AnyView(LiquidPathView(path: path, interpolate: interpolate, samples: samples, period: period))
    }
    
    public var body: some View {
        content
    }
}
