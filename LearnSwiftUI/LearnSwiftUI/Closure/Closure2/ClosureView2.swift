// 

import SwiftUI

struct ClosureView2: View {
    @StateObject private var viewModel: ClosureViewModel2 = .init()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            viewModel.uiState.closure()
            
            Button(action: viewModel.uiState.onTapAction) {
                Text("Tap me")
            }
        }
        .padding()
    }
    
    struct UIState: Equatable {
        
        let name: String
        let onTapAction: () -> Void
        var closure: () -> AnyView
        
        static func == (lhs: ClosureView2.UIState, rhs: ClosureView2.UIState) -> Bool {
            lhs.name == rhs.name
        }
    }
}

#Preview {
    ClosureView2()
}
