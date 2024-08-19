//
//  LiquidPathView.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI
import Accelerate

struct LiquidPathView: View {
    let pointCloud: (x: [Double], y: [Double])
    @State var x: AnimatableArray = .zero
    @State var y: AnimatableArray = .zero
    @State var samples: Int
    @State var animate: Bool
    let period: TimeInterval

    init(path: CGPath, interpolate: Int, samples: Int, period: TimeInterval, animate: Bool) {
        self._samples = .init(initialValue: samples)
        self.period = period
        self.pointCloud = path.getPoints().interpolate(interpolate)
        self._animate = .init(initialValue: animate)
    }

    func generate() {
        guard animate else { return }
        
        if #available(iOS 17.0, *) {
            withAnimation(.linear(duration: period)) {
                let points = Array(0..<pointCloud.x.count).randomElements(samples)
                self.x = AnimatableArray(points.map { self.pointCloud.x[$0] })
                self.y = AnimatableArray(points.map { self.pointCloud.y[$0] })
            } completion: {
                self.generate()
            }
        } else {
            withAnimation(.linear(duration: period)) {
                let points = Array(0..<pointCloud.x.count).randomElements(samples)
                self.x = AnimatableArray(points.map { self.pointCloud.x[$0] })
                self.y = AnimatableArray(points.map { self.pointCloud.y[$0] })
            }
            Task.delayed(by: .seconds(period)) { @MainActor in
                self.generate()
            }
        }
    }

    var body: some View {
        LiquidPath(x: x, y: y)
            .onAppear {
                self.generate()
            }
            .onDisappear {
                animate = false
            }
    }
}
