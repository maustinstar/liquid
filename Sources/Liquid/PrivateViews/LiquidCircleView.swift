//
//  LiquidCircleView.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI

struct LiquidCircleView: View {
    @State var samples: Int
    @State var radians: AnimatableArray
    @State var animate: Bool
    let period: TimeInterval

    init(samples: Int, period: TimeInterval, animate: Bool) {
        self._samples = .init(initialValue: samples)
        self._radians = .init(initialValue: AnimatableArray(LiquidCircleView.generateRadial(samples)))
        self.period = period
        self._animate = .init(initialValue: animate)
    }

    var body: some View {
        LiquidCircle(radians: radians)
            .onAppear {
                animatedRadianUpdate()
            }
            .onDisappear {
                animate = false
            }
    }

    static func generateRadial(_ count: Int = 6) -> [Double] {
        var radians: [Double] = []
        let offset = Double.random(in: 0...(.pi / Double(count)))
        for i in 0..<count {
            let min = Double(i) / Double(count) * 2 * .pi
            let max = Double(i + 1) / Double(count) * 2 * .pi
            radians.append(Double.random(in: min...max) + offset)
        }

        return radians
    }

    func animatedRadianUpdate() {
        guard animate else { return }
        
        if #available(iOS 17.0, *) {
            withAnimation(.linear(duration: period)) {
                radians = AnimatableArray(LiquidCircleView.generateRadial(samples))
            } completion: {
                self.animatedRadianUpdate()
            }
        } else {
            withAnimation(.linear(duration: period)) {
                radians = AnimatableArray(LiquidCircleView.generateRadial(samples))
            }
            Task.delayed(by: .seconds(period)) { @MainActor in
                self.animatedRadianUpdate()
            }
        }
    }
}
