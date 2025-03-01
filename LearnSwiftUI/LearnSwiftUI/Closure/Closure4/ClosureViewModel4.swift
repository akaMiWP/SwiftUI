//

import Combine
import SwiftUI

final class ClosureViewModel4: ObservableObject {
    @Published var uiState: ClosureView4.UIState = .default
    
    private let onTapActionPublisher = PassthroughSubject<Void, Never>()
    
    init() {
        let actor = ClosureActor(onTapActionPublisher: onTapActionPublisher)
        actor.contentUIPublisher.assign(to: &$uiState)
        
        onTapActionPublisher.send(())
    }
}
