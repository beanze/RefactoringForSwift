import Foundation

struct CH01_2 {

    func statement(invoice: Invoice, plays: [String: Play]) -> String {
        var totalAmount = 0
        var volumeCredits = 0
        var result = "청구 내역 (고객명: \(invoice.customer)\n"

        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2

        for perf in invoice.performances {
            guard let play = plays[perf.playID] else {
                fatalError("알 수 없는 공연: \(perf.playID)")
            }
            let thisAmount = self.amountFor(perf: perf, play: play)

            // 포인트를 적립한다.
            volumeCredits += max(perf.audience - 30, 0)
            // 희극 관객 5명마다 추가 포인트를 제공한다.
            if "comedy" == play.type {
                volumeCredits += perf.audience / 5
            }

            guard let amount = formatter.string(from: NSNumber(value: thisAmount)) else {
                fatalError("알 수 없는 금액: \(thisAmount)")
            }

            // 청구 내역을 출력한다.
            result += "    \(play.name): \(amount) (\(perf.audience)석)\n"
            totalAmount += thisAmount
        }

        guard let amount = formatter.string(from: NSNumber(value: totalAmount)) else {
            fatalError("알 수 없는 총액: \(totalAmount)")
        }

        result += "총액: \(amount)\n"
        result += "적립 포인트: \(volumeCredits)점\n"

        return result
    }

    func amountFor(perf: Performance, play: Play) -> Int {
        var thisAmount = 0

        switch play.type {
        case "tragedy": // 비극
            thisAmount = 40000
            if perf.audience > 30 {
                thisAmount += 1000 * (perf.audience - 30)
            }
        case "comedy": // 희극
            thisAmount = 30000
            if perf.audience > 20 {
                thisAmount += 1000 + 500 * (perf.audience - 20)
            }
            thisAmount += 300 * perf.audience
        case let unknown:
            fatalError("알 수 없는 장르: \(unknown)")
        }

        return thisAmount
    }
}
