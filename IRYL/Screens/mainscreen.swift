import SwiftUI

struct mainScreen: View {
    @State private var showTermsAndPrivacy = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isfirstViewPresented = false
    @State var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.purple.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 48) {
                    LogoAndGreetingsView()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color.white.opacity(0.08))
                            .frame(width: 279, height: 297)
                        
                        LinearGradient(colors: [Color.clear, Color.init(hex: "7743DB")], startPoint: .top, endPoint: .bottom)
                            .frame(height: 297)
                            .mask(RoundedRectangle(cornerRadius: 28))
                            .offset(y: 301)
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                ProfileView(imageName: "madisyn_profile", name: "Madisyn", age: 24, interest: "Biking", rotation: -9.15, x: -22)
                                ProfileView(imageName: "cameron_profile", name: "Cameron", age: 25, interest: "Biking", rotation: 7.12, x:22)
                            }
                            
                            Text("Hey! Bet you can't keep up with\nme on a bike 😜")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 10)
                                .background(Color.init(hex: "8658DF"))
                                .cornerRadius(10)
                            
                            Text("Madisyn")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .offset(x:-90, y:-10)
                        }
                        Image(.star)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 74.45, height: 74.45)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .offset(y:10)
                    }
                    .offset(y:-100)
                    
                    Text("Life's too short for boring convos")
                        .font(.custom("Outfit", size: 16, relativeTo: .body))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .offset(y:-120)
                }
                
                VStack(spacing: 8) {
                    Spacer()
                            NavigationLink(destination: tellUsAboutYourselfOne(showErrorAlert: $showErrorAlert)
                                .alert(isPresented: $showErrorAlert) {
                                    Alert(title: Text("Error"), message: Text("Please fill in all details."), dismissButton: .default(Text("OK")))
                                }, isActive: $isfirstViewPresented) {
                        Text("CONTINUE")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.purple)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .onTapGesture {
                            isfirstViewPresented = true
                            }
                    }
                    
                    Text("By continuing, you confirm that you have read and agree to our")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 4) {
                        Text("Terms of Use")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .underline()
                        
                        Text("Privacy Policy")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .padding()
            }
        }
    }
}

