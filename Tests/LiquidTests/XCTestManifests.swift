import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LiquidTests.allTests),
        testCase(AnimatableArrayTests.allTests),
        testCase(PathTests.allTests),
    ]
}
#endif
