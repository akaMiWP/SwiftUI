//

import Combine
import SwiftUI

final class ClosureViewModel3: ObservableObject {
    @Published var uiState: ClosureView3.UIState = .init(
        name: "",
        closure: { AnyView(EmptyView()) }
    )
    
    private var baseCurrency = "XXX"
    private var destinationCurrency = "YYY"
    
    init() {
        updateUIState()
    }
    
    func updateUIState() {
        uiState = .init(
            name: "",
            closure: {
                AnyView(
                    ClosureSubView3(
                        uiState: .init(
                            baseCurrency: self.baseCurrency,
                            destinationCurrency: self.destinationCurrency,
                            onTapAction: {
                                let temp = self.baseCurrency
                                self.baseCurrency = self.destinationCurrency
                                self.destinationCurrency = temp
                                
                                self.updateUIState()
                            }
                        )
                    )
                )
            }
        )
    }
}
