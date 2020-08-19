import XCTest
@testable import Liquid

final class PathTests: XCTestCase {
    
    func testControlPointTangent() {
        // A 45 degree right triangle
        let x: [Double] = [0, 3, 3]
        let y: [Double]  = [0, 3, 0]
        
        let controls = ControlPoints(x: x, y: y)
        XCTAssert(controls.x1[1] == 0)
        XCTAssert(controls.x2[0] == 0)
        XCTAssert(controls.y1[2] == 3)
        XCTAssert(controls.y2[1] == 3)
    }
    
    func testControlPointTangentCG() {
        // A 45 degree right triangle
        let points = [CGPoint(x: 0, y: 0), CGPoint(x: 3, y: 3), CGPoint(x: 3, y: 0)]
        let controls = ControlPoints(points)
        XCTAssert(controls.x1[1] == 0)
        XCTAssert(controls.x2[0] == 0)
        XCTAssert(controls.y1[2] == 3)
        XCTAssert(controls.y2[1] == 3)
    }

    static var allTests = [
        ("testControlPointTangent", testControlPointTangent),
    ]
}
