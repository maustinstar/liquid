//
//  File.swift
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
    @State var cancellable: Cancellable?
    let period: TimeInterval
    let trigger: Timer.TimerPublisher
    
    init(path: CGPath, interpolate: Int, samples: Int, period: TimeInterval) {
        self._samples = .init(initialValue: samples)
        self.trigger = Timer.TimerPublisher(interval: period, runLoop: .main, mode: .common)
        self.period = period
        self._cancellable = .init(initialValue: .none)
        self.pointCloud = path.getPoints().interpolate(interpolate)
    }
    
    func generate() {
        let points = Array(0..<pointCloud.x.count).randomElements(samples)
        self.x = AnimatableArray(points.map { self.pointCloud.x[$0] })
        self.y = AnimatableArray(points.map { self.pointCloud.y[$0] })
    }
    
    var body: some View {
        LiquidPath(x: x, y: y)
            .animation(.linear(duration: period))
            .onReceive(trigger) { _ in
                self.generate()
            }.onAppear {
                self.cancellable = trigger.connect()
                self.generate()
            }.onDisappear {
                self.cancellable?.cancel()
            }
    }
}
