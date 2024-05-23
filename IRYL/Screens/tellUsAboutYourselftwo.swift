import SwiftUI

struct TellUsAboutYourselfView: View {
    @State private var height: Double = 150.0
    @State private var drinkHabit: Double = 1.0
    @State private var smokeHabit: Double = 1.0
    @State private var exerciseHabit: Double = 1.0
    @State private var isThirdViewPresented = false
    @Environment(\.presentationMode) var presentationMode
    @State private var userHobby: UserHobby?
    var userDetails: UserDetails?
    var name:String
    var DOB:String
    var gender:String
    
    enum HabitLevel: String, CaseIterable {
        case never = "Never"
        case sometimes = "Sometimes"
        case often = "Often"
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    .background(Color.white)
                    .offset(x:-18, y:-10)
                    Spacer()
                    
                    Text("Skip")
                        .foregroundColor(.purple)
                        .offset(x:0, y:-10)
                }
                TitleView(screen: "two")
                    .frame(height: 120)
                    .padding(.top, 40)
                SliderView()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Do you drink?")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black.opacity(0.9))
                    
                    DrinkSlider(selection: $drinkHabit)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Do you smoke?")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black.opacity(0.9))
                    
                    DrinkSlider(selection: $smokeHabit)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Are you doing activity/exercise?")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black.opacity(0.9))
                    
                    DrinkSlider(selection: $exerciseHabit)
                }
                
                Spacer()
                
                Button(action: {
                    isThirdViewPresented = true
                }) {
                    NavigationLink(isActive: $isThirdViewPresented) {
                        BioView(name:name, DOB: DOB, gender: gender, height: height, drinkHabit:drinkHabit, smokeHabit: smokeHabit, exerciseHabit: exerciseHabit)
                    } label: {
                        Text("CONTINUE")
                            .font(.custom("Termina", size: 16, relativeTo: .body).bold())
                            .foregroundColor(.white)
                            .frame(width: 329)
                            .padding()
                            .background(Color(red: 119/255, green: 67/255, blue: 219/255))
                            .cornerRadius(8)
                            .onTapGesture {
                                userHobby = UserHobby(
                                    height: height,
                                    drinkHabit: drinkHabit,
                                    smokeHabit: smokeHabit,
                                    exerciseHabit: exerciseHabit
                                )
                                isThirdViewPresented=true
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

