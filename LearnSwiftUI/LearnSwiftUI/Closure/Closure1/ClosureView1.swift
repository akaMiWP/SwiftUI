// 

import SwiftUI

struct ClosureView1: View {
    @StateObject private var viewModel: ClosureViewModel1 = .init()
    
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
    ClosureView1()
}
