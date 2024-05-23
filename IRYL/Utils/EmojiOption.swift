import SwiftUI

struct EmojiOption: View {
    let emoji: String
    let label: String
    let backgroundColor: Color
    let textColor: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#222222"))
                .frame(width: 40, height: 40)
            Text(label)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .frame(height: 21)
        }
        .frame(width: 110, height: 110)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}
