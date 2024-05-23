import SwiftUI

struct FloatingIcon: View {
    var iconName: String
    var screenNo: String
    var body: some View {
        if(screenNo == "one")
        {
            Image(iconName == "calander" ? .calander : .cake)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(Color(hex: "#323234"))
                .padding(16.8)
                .background(Color.white)
                .cornerRadius(42)
                .shadow(color: Color.gray.opacity(0.25), radius: 5)
        }
        else if(screenNo == "two")
        {
            Image(iconName == "telescope" ? .telescope : .wine)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(Color(hex: "#323234"))
                .padding(16.8)
                .background(Color.white)
                .cornerRadius(42)
                .shadow(color: Color.gray.opacity(0.25), radius: 5)
        }
        else
        {
            Image(iconName == "bulb" ? .bulb : .ohhwhat)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(Color(hex: "#323234"))
                .padding(16.8)
                .background(Color.white)
                .cornerRadius(42)
                .shadow(color: Color.gray.opacity(0.25), radius: 5)
        }
    }
}
