//
//  LiquidCircleView.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI
import Combine

struct LiquidCircleView: View {
    @State var samples: Int
    @State var radians: AnimatableArray
    @State var trigger: Timer.TimerPublisher?
    @State var cancellable: Cancellable?
    let period: TimeInterval

    init(samples: Int, period: TimeInterval) {
        self._samples = .init(initialValue: samples)
        self._radians = .init(initialValue: AnimatableArray(LiquidCircleView.generateRadial(samples)))
        self.period = period
    }

    var body: some View {
        LiquidCircle(radians: radians)
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
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

    private func startTimer() {
        guard cancellable == nil else { return }

        // Get the animation started immediately by updating the radians.
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            animatedRadianUpdate()
        }

        // Periodically update the radians to continue the animation.
        cancellable = Timer.publish(every: period, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                animatedRadianUpdate()
            }

        func animatedRadianUpdate() {
            withAnimation(.linear(duration: period)) {
                radians = AnimatableArray(LiquidCircleView.generateRadial(samples))
            }
        }
    }

    private func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
}
