// 

import Combine
import SwiftUI

protocol ClosureActorProtocol5 {
    var contentUIPublisher: AnyPublisher<ClosureViewContent5.UIState, Never> { get }
}

struct ClosureActor5: ClosureActorProtocol5 {
    var contentUIPublisher: AnyPublisher<ClosureViewContent5.UIState, Never>
    
    private var baseCurrency = "XXX"
    private var destinationCurrency = "YYY"
    
    init(onTapActionPublisher: PassthroughSubject<Void, Never>) {
        contentUIPublisher = Empty().eraseToAnyPublisher()
        
        var mutableSelf = self
        
        let statePublisher = onTapActionPublisher
            .handleEvents(receiveOutput: {
                let temp = mutableSelf.baseCurrency
                mutableSelf.baseCurrency = mutableSelf.destinationCurrency
                mutableSelf.destinationCurrency = temp
            })
            .map { _ -> SubView.UIState in
                    .init(
                        baseCurrency: mutableSelf.baseCurrency,
                        destinationCurrency: mutableSelf.destinationCurrency,
                        onTapAction: { onTapActionPublisher.send(()) }
                    )
            }
            .eraseToAnyPublisher()
        
        contentUIPublisher = statePublisher
            .map { state in
                { AnyView(SubView(uiState: state)) }
            }
            .map { closure in
                ClosureViewContent5.UIState(closure: closure)
            }
            .eraseToAnyPublisher()
    }
}
