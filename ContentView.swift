import SwiftUI

struct ContentView: View {
    @State private var purchasePrice: Double = 100_000
    @State private var downPayment: Double = 20_000
    @State private var repaymentTime: Double = 25
    @State private var interestRate: Double = 3
    
    var monthlyPayment: Double {
        let interestAsDecimal = (interestRate / 100) / 12.0
        let interestPlusOne = interestAsDecimal + 1
        let interestToPower = pow(interestPlusOne, repaymentTime * 12.0)
        let numerator = interestAsDecimal * interestToPower
        let denominator = interestToPower - 1
        return loanAmount * (numerator/denominator)
    }
    
    var loanAmount: Double {
        purchasePrice - downPayment
    }
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Group {
                    Text("Purchase Price: $\(purchasePrice.describeAsFixedLengthString())")
                        .font(.title2)
                    HStack {
                        Text("$20,000")
                        Slider(value: $purchasePrice, in: 20_000...2_000_000, step: 1000)
                        Text("$2,000,000")
                    }
                    Spacer()
                    Text("Down Payment: $\(downPayment.describeAsFixedLengthString())")
                        .font(.title2)
                    HStack {
                        Text("$10,000")
                        Slider(value: $downPayment, in: 10_000...500_000, step: 1000)
                        Text("$500,000")
                    }
                    Spacer()
                    Text("Repayment Time: \(repaymentTime.describeAsFixedLengthString()) years")
                        .font(.title2)
                    HStack {
                        Text("1")
                        Slider(value: $repaymentTime, in: 1...50, step: 1)
                        Text("50")
                    }
                }
                Spacer()
                Group {
                    Text("Interest Rate: \(interestRate.describeAsFixedLengthString())%")
                        .font(.title2)
                    HStack {
                        Text("1%")
                        Slider(value: $interestRate, in: 1...30, step: 1)
                        Text("30%")
                    }
                    Spacer()
                }
                VStack {
                Text("Loan Amount")
                    .font(.title2)
                    .fontWeight(.bold)
                Group {
                    
                    Text("$") + Text(loanAmount > 0 ? loanAmount.formatted(.number) : "Down Payment cannot be greater than purchase price.")
                        
                }.font(.largeTitle).padding(.bottom)
                    
                Text("Estimated Monthly Payment")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("$").font(.largeTitle)+Text(loanAmount > 0 ? monthlyPayment.describeAsFixedLengthString() : "Down Payment cannot be greater than purchase price.") 
                    .font(.largeTitle)
                }.padding()
                .background(.ultraThickMaterial)
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Mortgage Calculator")
    }
    
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue.opacity(0.2), Color.green.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}
