import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Action for back button
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.black)
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.gray.opacity(0.25), radius: 5)
            
            Spacer()
        }
    }
}
