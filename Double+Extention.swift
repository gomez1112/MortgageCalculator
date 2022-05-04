import SwiftUI

extension Double {
    func describeAsFixedLengthString() -> String {
        self.formatted(
            .number
                .sign(strategy: .never)
                .precision(
                    .fractionLength(0)
                )
        )
    }
}
