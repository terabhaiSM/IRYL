import SwiftUI

struct ProfileView: View {
    let imageName: String
    let name: String
    let age: Int
    let interest: String
    let rotation: Double
    var x: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 13)
                .fill(Color.init(hex: "8658DF"))
                .frame(width: 155, height: 155)
                .rotationEffect(Angle(degrees: rotation))
            
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.init(hex: "8658DF"))
                    .frame(width: 141, height: 141)
                    .shadow(radius: 7)
                    .rotationEffect(Angle(degrees: rotation))
                if(imageName == "madisyn_profile")
                {
                    Image(.girl)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 155, height: 155)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .rotationEffect(Angle(degrees: rotation+10))
                }
                else
                {
                    Image(.boy)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 155, height: 155)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .rotationEffect(Angle(degrees: rotation-7))
                }
            }
            
            HStack(spacing: 5) {
                Text(name)
                    .font(.custom("Termina Test-Bold", size: 13, relativeTo: .body))
                    .foregroundColor(Color.init(hex: "272728"))
                
                Text("\(age)")
                    .font(.custom("Termina Test-Bold", size: 13, relativeTo: .body))
                    .foregroundColor(Color.init(hex: "7743DB"))
            }
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(Color.white)
            .cornerRadius(32)
            .shadow(radius: 3)
            .rotationEffect(Angle(degrees: rotation))
            .offset(x:x, y: 80)
            
            // Add other components like the heart icon and interest badge here
        }
    }
}
