import SwiftUI

struct DrinkSlider: View {
    @Binding var selection: Double
    
    var body: some View {
        VStack(spacing: 16) {
            CustomSlider(value: $selection, range: 0...2, step: 1)
                .accentColor(.purple)
                .padding(.horizontal)
            
            HStack {
                Image(selection == 0 ? "never_image" : "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                Spacer()
                Text("Sometimes")
                    .foregroundColor(selection == 1 ? .black : .gray)
                Spacer()
                Text("Always")
                    .foregroundColor(selection == 2 ? .black : .gray)
            }
            .font(.system(size: 14, weight: .medium))
        }
    }
}

