import Foundation

let playsJsonString = """
{ "hamlet": {"name": "Hamlet", "type": "tragedy"}, "as-like": {"name": "As You Like It", "type": "comedy"}, "othello": {"name": "Othello", "type": "tragedy"} }
"""

let invoicesJsonString = """
{ "customer": "BigCo", "performances": [ { "playID": "hamlet", "audience": 55
}, { "playID": "as-like", "audience": 35
},{ "playID": "othello", "audience": 40
} ] }
"""

struct Play: Codable {

    let name: String

    let type: String

}

struct Performance: Codable {

    let playID: String

    let audience: Int

}

struct Invoice: Codable {

    let customer: String

    let performances: [Performance]

}

enum Data {

    static func data() -> (invoice: Invoice, plays: [String: Play]) {
        guard let playData = playsJsonString.data(using: .utf8),
              let plays = try? JSONDecoder().decode([String: Play].self, from: playData) else {
            fatalError("[String: Play] 디코딩 실패")
        }

        guard let invoiceData = invoicesJsonString.data(using: .utf8),
              let invoice = try? JSONDecoder().decode(Invoice.self, from: invoiceData) else {
            fatalError("Invoice 디코딩 실패")
        }

        return (invoice, plays)
    }

}
