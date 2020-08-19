import XCTest
@testable import CLiquid

final class PerformanceTests: XCTestCase {
    
    func testCPerformance() {
        
        let count = 1_000_000
        
        var x: [Double] = []
        x.reserveCapacity(count)
        for _ in 1...count {
            x.append(Double.random(in: 0.0...Double(count)))
        }
        
        var y: [Double] = []
        y.reserveCapacity(count)
        for _ in 1...count {
            y.append(Double.random(in: 0.0...Double(count)))
        }
        
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            var x1: [Double] = [Double](repeating: 0, count: count)
            var y1: [Double] = [Double](repeating: 0, count: count)
            var x2: [Double] = [Double](repeating: 0, count: count)
            var y2: [Double] = [Double](repeating: 0, count: count)
            bezier_ctrl(Int32(count), x, y, &x1, &y1, &x2, &y2)
        }
    }
    
    func testSwiftPerformance() {
        
        let count = 1_000_000
        
        var x: [Double] = []
        x.reserveCapacity(count)
        for _ in 1...count {
            x.append(Double.random(in: 0.0...Double(count)))
        }
        
        var y: [Double] = []
        y.reserveCapacity(count)
        for _ in 1...count {
            y.append(Double.random(in: 0.0...Double(count)))
        }
        
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            var x1: [Double] = [Double](repeating: 0, count: count)
            var y1: [Double] = [Double](repeating: 0, count: count)
            var x2: [Double] = [Double](repeating: 0, count: count)
            var y2: [Double] = [Double](repeating: 0, count: count)
            
            var prev = count - 1;
            var next = 1;
            for i in 0..<count {
                var dx = x[prev] - x[next];
                var dy = y[prev] - y[next];
                let m = sqrt(dx * dx + dy * dy);
                dx /= m;
                dy /= m;
                
                let next_dx = x[i] - x[next];
                let next_dy = y[i] - y[next];
                let next_dist = sqrt(next_dx * next_dx + next_dy * next_dy);
                x1[next] = x[i] - dx * next_dist / 3.0;
                y1[next] = y[i] - dy * next_dist / 3.0;
                
                let prev_dx = x[i] - x[prev];
                let prev_dy = y[i] - y[prev];
                let prev_dist = sqrt(prev_dx * prev_dx + prev_dy * prev_dy);
                x2[i] = x[i] + dx * prev_dist / 3.0;
                y2[i] = y[i] + dy * prev_dist / 3.0;
                
                prev = (prev + 1) % count;
                next = (next + 1) % count;
            }
        }
    }
    
    func testValid() {
        let count = 1_000_000
        
        var x: [Double] = []
        x.reserveCapacity(count)
        for _ in 1...count {
            x.append(Double.random(in: 0.0...Double(count)))
        }
        
        var y: [Double] = []
        y.reserveCapacity(count)
        for _ in 1...count {
            y.append(Double.random(in: 0.0...Double(count)))
        }
        
        // Swift
        var x1: [Double] = [Double](repeating: 0, count: count)
        var y1: [Double] = [Double](repeating: 0, count: count)
        var x2: [Double] = [Double](repeating: 0, count: count)
        var y2: [Double] = [Double](repeating: 0, count: count)
        
        var prev = count - 1;
        var next = 1;
        for i in 0..<count {
            var dx = x[prev] - x[next];
            var dy = y[prev] - y[next];
            let m = sqrt(dx * dx + dy * dy);
            dx /= m;
            dy /= m;
            
            let next_dx = x[i] - x[next];
            let next_dy = y[i] - y[next];
            let next_dist = sqrt(next_dx * next_dx + next_dy * next_dy);
            x1[next] = x[i] - dx * next_dist / 3.0;
            y1[next] = y[i] - dy * next_dist / 3.0;
            
            let prev_dx = x[i] - x[prev];
            let prev_dy = y[i] - y[prev];
            let prev_dist = sqrt(prev_dx * prev_dx + prev_dy * prev_dy);
            x2[i] = x[i] + dx * prev_dist / 3.0;
            y2[i] = y[i] + dy * prev_dist / 3.0;
            
            prev = (prev + 1) % count;
            next = (next + 1) % count;
        }
        
        // C
        var cx1: [Double] = [Double](repeating: 0, count: count)
        var cy1: [Double] = [Double](repeating: 0, count: count)
        var cx2: [Double] = [Double](repeating: 0, count: count)
        var cy2: [Double] = [Double](repeating: 0, count: count)
        bezier_ctrl(Int32(count), x, y, &cx1, &cy1, &cx2, &cy2)
        
        // Assertions
        XCTAssert(x1 == cx1)
        XCTAssert(y2 == cy2)
        XCTAssert(x1 == cx1)
        XCTAssert(y2 == cy2)
    }
}
