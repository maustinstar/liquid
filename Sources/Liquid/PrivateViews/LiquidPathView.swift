//
//  LiquidPathView.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI
import Combine
import Accelerate

struct LiquidPathView: View {

    let pointCloud: (x: [Double], y: [Double])
    @State var x: AnimatableArray = .zero
    @State var y: AnimatableArray = .zero
    @State var samples: Int
    let period: TimeInterval
    let trigger: Timer.TimerPublisher

    var cancellable: Cancellable?

    init(path: CGPath, interpolate: Int, samples: Int, period: TimeInterval) {
        self._samples = .init(initialValue: samples)
        self.period = period
        self.trigger = Timer.TimerPublisher(interval: period, runLoop: .main, mode: .common)
        self.cancellable = self.trigger.connect()
        self.pointCloud = path.getPoints().interpolate(interpolate)
    }

    func generate() {
        withAnimation(.linear(duration: period)) {
            let points = Array(0..<pointCloud.x.count).randomElements(samples)
            self.x = AnimatableArray(points.map { self.pointCloud.x[$0] })
            self.y = AnimatableArray(points.map { self.pointCloud.y[$0] })
        }
    }

    var body: some View {
        LiquidPath(x: x, y: y)
            .onReceive(trigger) { _ in
                self.generate()
            }.onAppear {
                self.generate()
            }.onDisappear {
                self.cancellable?.cancel()
            }
    }
}
