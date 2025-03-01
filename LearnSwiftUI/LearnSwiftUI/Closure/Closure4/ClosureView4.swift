// 

import SwiftUI

struct ClosureView4: View {
    @StateObject private var viewModel: ClosureViewModel4 = .init()
    
    var body: some View {
        VStack {
            viewModel.uiState.closure()
        }
        .padding()
    }
    
    struct UIState: Equatable {
        
        let name: String
        let closure: () -> AnyView
        
        static func == (lhs: ClosureView4.UIState, rhs: ClosureView4.UIState) -> Bool {
            lhs.name == rhs.name
        }
        
        static var `default`: UIState = .init(name: "", closure: { AnyView(EmptyView()) })
    }
}

#Preview {
    ClosureView4()
}
