// 

import SwiftUI

struct ClosureView3: View {
    @StateObject private var viewModel: ClosureViewModel3 = .init()
    
    var body: some View {
        VStack {
            viewModel.uiState.closure()
        }
        .padding()
    }
    
    struct UIState: Equatable {
        
        let name: String
        let closure: () -> AnyView
        
        static func == (lhs: ClosureView3.UIState, rhs: ClosureView3.UIState) -> Bool {
            lhs.name == rhs.name
        }
    }
}

#Preview {
    ClosureView3()
}
