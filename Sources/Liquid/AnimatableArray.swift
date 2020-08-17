//
//  AnimatableArray.swift
//  
//
//  Created by Michael Verges on 8/14/20.
//

import SwiftUI
import enum Accelerate.vDSP

struct AnimatableArray: VectorArithmetic {
    
    var values: [Double]
    
    init(_ values: [Double]) {
        self.values = values
    }
    
    static var zero = AnimatableArray([0.0])

    static func + (lhs: AnimatableArray, rhs: AnimatableArray) -> AnimatableArray {
        let count = min(lhs.values.count, rhs.values.count)
        return AnimatableArray(vDSP.add(lhs.values[0..<count], rhs.values[0..<count]))
    }

    static func += (lhs: inout AnimatableArray, rhs: AnimatableArray) {
        let count = min(lhs.values.count, rhs.values.count)
        vDSP.add(lhs.values[0..<count], rhs.values[0..<count], result: &lhs.values[0..<count])
    }

    static func - (lhs: AnimatableArray, rhs: AnimatableArray) -> AnimatableArray {
        let count = min(lhs.values.count, rhs.values.count)
        return AnimatableArray(vDSP.subtract(lhs.values[0..<count], rhs.values[0..<count]))
    }

    static func -= (lhs: inout AnimatableArray, rhs: AnimatableArray) {
        let count = min(lhs.values.count, rhs.values.count)
        vDSP.subtract(lhs.values[0..<count], rhs.values[0..<count], result: &lhs.values[0..<count])
    }

    mutating func scale(by rhs: Double) {
        vDSP.multiply(rhs, values, result: &values)
    }

    var magnitudeSquared: Double {
        vDSP.sum(vDSP.multiply(values, values))
    }
}
