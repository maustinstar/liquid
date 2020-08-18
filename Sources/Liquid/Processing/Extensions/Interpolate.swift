//
//  Interpolate.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import Accelerate

extension Array where Element == Double {
    /// Re-samples data into `n` elements
    /// - Parameter n: Number of samples
    /// - Returns: Interpolated array with length `n`
    func interpolate(_ n: Int) -> [Double] {
        
        let stride = vDSP_Stride(1)
        
        var base: Double = 0
        var end = Double(n - 1)
        var control = [Double](repeating: 0, count: count)
        vDSP_vgenD(&base, &end, &control, stride, vDSP_Length(count))
        
        var result = [Double](repeating: 0, count: n)
        vDSP_vgenpD(self, stride, control, stride, &result, stride, vDSP_Length(n), vDSP_Length(self.count))
        
        return result
    }
}

extension Array where Element == CGPoint {
    /// Re-samples data into `n` elements
    /// - Parameter n: Number of samples
    /// - Returns: Two arrays for x and y, each with length `n`
    func interpolate(_ n: Int) -> (x: [Double], y: [Double]) {
        let x = self.map { Double($0.x) }
        let y = self.map { Double($0.y) }
        return (x.interpolate(n), y.interpolate(n))
    }
}
