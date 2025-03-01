// 

import Combine
import SwiftUI

protocol ClosureActorProtocol {
    var contentUIPublisher: AnyPublisher<ClosureView4.UIState, Never> { get }
}

final class ClosureActor: ClosureActorProtocol {
    
    var contentUIPublisher: AnyPublisher<ClosureView4.UIState, Never>
    
    private var baseCurrency = "XXX"
    private var destinationCurrency = "YYY"
    
    init(onTapActionPublisher: PassthroughSubject<Void, Never>) {
        contentUIPublisher = Just(ClosureView4.UIState.default)
            .eraseToAnyPublisher()
        
        contentUIPublisher = onTapActionPublisher
            .handleEvents(receiveOutput: { [weak self] in
                guard let self else { return }
                let temp = baseCurrency
                baseCurrency = destinationCurrency
                destinationCurrency = temp
            })
            .map {
                let uiState: ClosureView4.UIState = .init(
                    name: "",
                    closure: {
                        AnyView(
                            SubView(
                                uiState: .init(
                                    baseCurrency: self.baseCurrency,
                                    destinationCurrency: self.destinationCurrency,
                                    onTapAction: onTapActionPublisher.send
                                )
                            )
                        )
                    }
                )
                return uiState
            }
            .eraseToAnyPublisher()
    }
}
