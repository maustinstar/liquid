//
//  Array.swift
//  
//
//  Created by Michael Verges on 8/17/20.
//

import Foundation

extension Array {
    func randomElements(_ n: Int) -> [Element] {
        var copy = self
        var selection: [Element] = []
        let range = count / n
        for _ in 0..<n {
            let max: Int = Swift.min(range, copy.count)
            let index = Int.random(in: 0...(max - 1))
            selection.append(copy[index])
            copy.removeFirst(range)
            if copy.isEmpty {
                return selection
            }
        }
        return selection
    }
}
