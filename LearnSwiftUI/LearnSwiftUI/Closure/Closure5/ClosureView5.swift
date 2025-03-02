// 

import SwiftUI

struct ClosureView5: View {
    
    @StateObject private var viewModel: ClosureViewModel5
    
    init(viewModel: ClosureViewModel5) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ClosureViewContent5(uiState: viewModel.uiState)
    }
}

#Preview {
    ClosureView5(viewModel: .init())
}

struct ClosureViewContent5: View {
    
    private let uiState: UIState
    
    init(uiState: UIState) {
        self.uiState = uiState
    }
    
    struct UIState {
        @ViewBuilder let closure: () -> AnyView
    }
    
    var body: some View {
        VStack {
            uiState.closure()
        }
        .padding()
    }
}
