import SwiftUI

struct LogoAndGreetingsView: View {
    var body: some View {
        VStack(spacing: 16) {
                    Image("logo")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .offset(x:0, y:-80)
                    
                    VStack(spacing: 8) {
                        Text("Get Your")
                            .font(.custom("Termina Test-Black", size: 32, relativeTo: .body))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        
                        Text("Game On")
                            .font(.custom("IBM Plex Serif Bold Italic", size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .italic() // Apply italic style
                            .kerning(0.01)

                    }
                    .offset(y:-80)
                }
    }
}

