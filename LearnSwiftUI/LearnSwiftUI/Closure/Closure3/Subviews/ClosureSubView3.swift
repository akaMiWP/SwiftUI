// 

import SwiftUI

struct ClosureSubView3: View {
    
    private let uiState: UIState
    
    init(uiState: UIState) {
        self.uiState = uiState
    }
    
    var body: some View {
        VStack {
            Text(uiState.baseCurrency)
            Text(uiState.destinationCurrency)
            Button(action: uiState.onTapAction) {
                Text("Tap me")
            }
        }
    }
    
    struct UIState: Equatable {
        
        let baseCurrency: String
        let destinationCurrency: String
        let onTapAction: () -> Void
        
        static func == (lhs: ClosureSubView3.UIState, rhs: ClosureSubView3.UIState) -> Bool {
            lhs.baseCurrency == rhs.baseCurrency &&
            lhs.destinationCurrency == rhs.destinationCurrency
        }
    }
}

#Preview {
    ClosureSubView3(uiState: .init(baseCurrency: "ABC", destinationCurrency: "BCD", onTapAction: {}))
}
