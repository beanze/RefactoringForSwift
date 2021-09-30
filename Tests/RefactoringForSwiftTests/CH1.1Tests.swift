import XCTest
@testable import RefactoringForSwift

final class CH01_1_Tests: XCTestCase {
    func testExample() throws {
        let (invoice, plays) = Data.data()
        print(CH01_1.statement(invoice: invoice, plays: plays))

    }
}
