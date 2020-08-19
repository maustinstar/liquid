import XCTest
@testable import Liquid

final class AnimatableArrayTests: XCTestCase {
    
    func testAdd() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        var rhs = AnimatableArray([5, 6, 7, 8, 9])
        XCTAssert(lhs + rhs == AnimatableArray([5, 7, 9, 11, 13]))
        
        lhs = AnimatableArray([0, 2])
        rhs = AnimatableArray([1, 7, 9])
        XCTAssert(lhs + rhs == AnimatableArray([1, 9]))
        XCTAssert(rhs + lhs == AnimatableArray([1, 9]))
    }
    
    func testIncrement() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        var rhs = AnimatableArray([5, 6, 7, 8, 9])
        lhs += rhs
        XCTAssert(lhs == AnimatableArray([5, 7, 9, 11, 13]))
        
        lhs = AnimatableArray([0, 2])
        rhs = AnimatableArray([1, 7, 9])
        lhs += rhs
        XCTAssert(lhs == AnimatableArray([1, 9]))
        
        lhs = AnimatableArray([1, 7, 9])
        rhs = AnimatableArray([0, 2])
        lhs += rhs
        XCTAssert(lhs == AnimatableArray([1, 9, 9]))
    }
    
    func testSubtract() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        var rhs = AnimatableArray([5, 6, 7, 8, 9])
        XCTAssert(lhs - rhs == AnimatableArray([-5, -5, -5, -5, -5]))
        
        lhs = AnimatableArray([0, 2])
        rhs = AnimatableArray([1, 7, 9])
        XCTAssert(lhs - rhs == AnimatableArray([-1, -5]))
        XCTAssert(rhs - lhs == AnimatableArray([1, 5]))
    }
    
    func testDecrement() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        var rhs = AnimatableArray([5, 6, 7, 8, 9])
        lhs -= rhs
        XCTAssert(lhs == AnimatableArray([-5, -5, -5, -5, -5]))
        
        lhs = AnimatableArray([0, 2])
        rhs = AnimatableArray([1, 7, 9])
        lhs -= rhs
        XCTAssert(lhs == AnimatableArray([-1, -5]))
        
        lhs = AnimatableArray([1, 7, 9])
        rhs = AnimatableArray([0, 2])
        lhs -= rhs
        XCTAssert(lhs == AnimatableArray([1, 5, 9]))
    }
    
    func testScale() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        lhs.scale(by: 2.0)
        XCTAssert(lhs == AnimatableArray([0, 2, 4, 6, 8]))
        
        lhs = AnimatableArray([0, 1, 2, 3, 4])
        lhs.scale(by: 1.0)
        XCTAssert(lhs == AnimatableArray([0, 1, 2, 3, 4]))
        
        lhs = AnimatableArray([0, 1, 2, 3, 4])
        lhs.scale(by: -2.0)
        XCTAssert(lhs == AnimatableArray([0, -2, -4, -6, -8]))
    }
    
    func testMagnitudeSquared() {
        var lhs = AnimatableArray([0, 1, 2, 3, 4])
        XCTAssert(lhs.magnitudeSquared == 30.0)
        
        lhs = AnimatableArray([1, 7, 9])
        XCTAssert(lhs.magnitudeSquared == 131.0)
        
        lhs = AnimatableArray([0, 2])
        XCTAssert(lhs.magnitudeSquared == 4.0)
    }
    
    static var allTests = [
        ("testAdd", testAdd),
        ("testIncrement", testIncrement),
        ("testSubtract", testSubtract),
        ("testDecrement", testDecrement),
        ("testScale", testScale),
        ("testMagnitudeSquared", testMagnitudeSquared),
    ]
}
