// 

import Combine
import SwiftUI

final class ClosureViewModel2: ObservableObject {
    @Published var uiState: ClosureView2.UIState = .init(
        name: "",
        onTapAction: {},
        closure: { AnyView(EmptyView()) }
    )
    
    private var number: Int = 0
    
    init() {
        uiState = .init(
            name: "name",
            onTapAction: {
                self.number += 1
                self.uiState.closure = {
                    AnyView(Text("Number mode: \(self.number)"))
                }
            },
            closure: { AnyView(Text("Hello World")) }
        )
    }
}
