// 

import Combine
import SwiftUI

final class ClosureViewModel: ObservableObject {
    @Published var closure: () -> AnyView = { AnyView(EmptyView())}
    var onTapAction: () -> Void = {}
    
    private var number = 0
    
    init() {
        onTapAction = {
            self.number += 1
            self.closure = {
                AnyView(Text("Number mode: \(self.number)"))
            }
        }
        closure = { AnyView(Text("Hello World")) }
    }
}
