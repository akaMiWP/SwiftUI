// 

import Combine
import SwiftUI

final class ClosureViewModel5: ObservableObject {
    
    @Published var uiState: ClosureViewContent5.UIState = .init(closure: { AnyView(EmptyView() )})
    
    private let onTapActionPublisher: PassthroughSubject<Void, Never> = .init()
    
    init() {
        let actor = ClosureActor5(onTapActionPublisher: onTapActionPublisher)
        actor.contentUIPublisher.assign(to: &$uiState)
        
        onTapActionPublisher.send(())
    }
}
