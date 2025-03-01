// 

import SwiftUI

struct SubView: View {
    
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
        
        static func == (lhs: SubView.UIState, rhs: SubView.UIState) -> Bool {
            lhs.baseCurrency == rhs.baseCurrency &&
            lhs.destinationCurrency == rhs.destinationCurrency
        }
    }
}

#Preview {
    SubView(uiState: .init(baseCurrency: "ABC", destinationCurrency: "BCD", onTapAction: {}))
}
