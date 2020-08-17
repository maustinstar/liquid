//
//  Interpolate.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import Accelerate

extension Array where Element == Double {
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
    
    func interpolate(_ n: Int) -> (x: [Double], y: [Double]) {
        let x = self.map { Double($0.x) }
        let y = self.map { Double($0.y) }
        return (x.interpolate(n), y.interpolate(n))
    }
}
