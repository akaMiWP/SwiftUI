// 

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ClosureViewModel = .init()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            viewModel.closure()
            
            Button(action: viewModel.onTapAction) {
                Text("Tap me")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
