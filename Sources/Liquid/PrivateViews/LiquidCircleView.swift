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
        
        startTimer()
    }
    
    var body: some View {
        LiquidCircle(radians: radians)
            .animation(.linear(duration: period))
            .onAppear {
                self.radians = AnimatableArray(LiquidCircleView.generateRadial(self.samples))
                
                self.startTimer()
            }
            .onDisappear {
                self.stopTimer()
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
        guard self.cancellable == nil else {
            return
        }
        
        self.cancellable = Timer.publish(every: period, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.radians = AnimatableArray(LiquidCircleView.generateRadial(self.samples))
            }
    }
    
    private func stopTimer() {
        self.cancellable?.cancel()
        self.cancellable = nil
    }
    
}
