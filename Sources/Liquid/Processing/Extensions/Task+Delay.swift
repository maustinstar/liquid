//
//  File.swift
//  
//
//  Created by Bence Borsos on 18/08/2024.
//

import Foundation

extension Task where Failure == Error {
    /// Create a delayed task that will wait for the given duration before performing its operation.
    @discardableResult static func delayed(by delay: OperationQueue.SchedulerTimeType.Stride, priority: TaskPriority? = nil, operation: @escaping @Sendable () async throws -> Success) -> Task {
        Task(priority: priority) {
            try await Task<Never, Never>.sleep(nanoseconds: UInt64(delay.timeInterval * .nanosecondsPerSecond))
            return try await operation()
        }
    }
}
