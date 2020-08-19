import XCTest
@testable import Liquid

final class ArrayTests: XCTestCase {
    func testRandomElements() {
        for _ in 0...5 {
            let source = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffled()
            var random = source.randomElements(6)
            XCTAssert(random.count == 6)
            XCTAssert(source[0...1].contains(random[0]))
            XCTAssert(source[2...3].contains(random[1]))
            XCTAssert(source[4...5].contains(random[2]))
            XCTAssert(source[6...7].contains(random[3]))
            XCTAssert(source[8...9].contains(random[4]))
            XCTAssert(source[10...11].contains(random[5]))
            
            random = source.randomElements(4)
            XCTAssert(random.count == 4)
            XCTAssert(source[0...2].contains(random[0]))
            XCTAssert(source[3...5].contains(random[1]))
            XCTAssert(source[6...8].contains(random[2]))
            XCTAssert(source[9...11].contains(random[3]))
            
            random = source.randomElements(3)
            XCTAssert(random.count == 3)
            XCTAssert(source[0...3].contains(random[0]))
            XCTAssert(source[4...7].contains(random[1]))
            XCTAssert(source[8...11].contains(random[2]))
            
            random = source.randomElements(2)
            XCTAssert(random.count == 2)
            XCTAssert(source[0...5].contains(random[0]))
            XCTAssert(source[6...11].contains(random[1]))
            
            random = source.randomElements(1)
            XCTAssert(random.count == 1)
            XCTAssert(source.contains(random[0]))
        }
    }
    
    func testInterpolateDouble() {
        XCTAssert([0.0, 1.0].interpolate(5) == [0.00, 0.25, 0.50, 0.75, 1.00])
        XCTAssert([0.0, 1.0, 4.0].interpolate(5) == [0.0, 0.5, 1.0, 2.5, 4.0])
        XCTAssert([0.0, -4.0, 0.0].interpolate(5) == [0.0, -2.0, -4.0, -2.0, 0.0])
    }
    
    func testInterpolateCGPoint() {
        let source = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: -4), CGPoint(x: 4, y: 0)]
        XCTAssert(source.interpolate(5) == ([0.0, 0.5, 1.0, 2.5, 4.0], [0.0, -2.0, -4.0, -2.0, 0.0]))
    }

    static var allTests = [
        ("testRandomElements", testRandomElements),
        ("testInterpolateDouble", testInterpolateDouble),
        ("testInterpolateCGPoint", testInterpolateCGPoint),
    ]
}
