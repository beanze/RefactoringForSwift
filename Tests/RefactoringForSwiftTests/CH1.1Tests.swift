import XCTest
@testable import RefactoringForSwift

final class CH01_1_Tests: XCTestCase {
    func testExample() throws {
        let (invoice, plays) = Data.data()

        let result_CH01_01 = CH01_1.statement(invoice: invoice, plays: plays)
        let result_CH01_02 = CH01_2().statement(invoice: invoice, plays: plays)

        XCTAssertEqual(result_CH01_01, result_CH01_02)
    }
}
