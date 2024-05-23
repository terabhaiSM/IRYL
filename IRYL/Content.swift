import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            mainScreen(presentationMode: _presentationMode)
        }
    }
}

#Preview {
    mainScreen()
}
