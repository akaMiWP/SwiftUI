// 

import Combine
import SwiftUI

protocol ClosureActorProtocol {
    var contentUIPublisher: AnyPublisher<ClosureView4.UIState, Never> { get }
}

struct ClosureActor: ClosureActorProtocol {
    
    var contentUIPublisher: AnyPublisher<ClosureView4.UIState, Never>
    
    private var baseCurrency = "XXX"
    private var destinationCurrency = "YYY"
    
    init(onTapActionPublisher: PassthroughSubject<Void, Never>) {
        contentUIPublisher = Empty().eraseToAnyPublisher()
        
        var mutableSelf = self  // Capture a mutable copy

        contentUIPublisher = onTapActionPublisher
            .handleEvents(receiveOutput: {
                mutableSelf.swapCurrencies()
            })
            .map { _ in
                mutableSelf.createUIState(onTapActionPublisher: onTapActionPublisher)
            }
            .eraseToAnyPublisher()
    }
    
    private mutating func swapCurrencies() {
        let temp = baseCurrency
        baseCurrency = destinationCurrency
        destinationCurrency = temp
    }

    private func createUIState(onTapActionPublisher: PassthroughSubject<Void, Never>) -> ClosureView4.UIState {
        return ClosureView4.UIState(
            name: "",
            closure: {
                AnyView(
                    SubView(
                        uiState: .init(
                            baseCurrency: self.baseCurrency,
                            destinationCurrency: self.destinationCurrency,
                            onTapAction: { onTapActionPublisher.send() }
                        )
                    )
                )
            }
        )
    }
}
