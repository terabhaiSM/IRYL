import SwiftUI

struct tellUsAboutYourselfOne: View {
    @State var firstName: String = ""
    @State var month: String = ""
    @State var day: String = ""
    @State var year: String = ""
    @State var selectedGender: String = "Man"
    @State var selectedMonth: Int = 11
    @State private var isSecondViewPresented = false
    @Environment(\.presentationMode) var presentationMode
    @State private var userDetails: UserDetails?
    @Binding var showErrorAlert: Bool
    func handleContinueButtonAction() {
    }
    
    let genders = ["Man", "Woman", "Non-Binary"]
    let genderColors = [
        "Man": Color(red: 142/255, green: 109/255, blue: 242/255),
        "Woman": Color(red: 142/255, green: 109/255, blue: 242/255),
        "Non-Binary": Color(red: 142/255, green: 109/255, blue: 242/255)
    ]
    let genderIcons = [
        "Man": Image(.man),
        "Woman": Image(.women),
        "Non-Binary": Image(.heart)
    ]
    
    let months = Array(1...12).map { String(format: "%02d", $0) }
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.black)
                        .padding()
                }
                .background(Color.white)
                .offset(x:-18, y:-10)
                
                TitleView(screen: "one")
                    .frame(height: 120)
                    .padding(.top, 40)
                Text("Your name")
                    .font(.custom("Outfit SemiBold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.9))
                    .frame(height: 23)
                
                TextField("What’s your first name?", text: $firstName)
                    .padding()
                    .frame(height: 48)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .font(.custom("Outfit SemiBold", size: 16))
                    .fontWeight(.medium)
                
                Text("Your birthday")
                    .font(.custom("Outfit SemiBold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.9))
                    .frame(height: 23)
                
                HStack(spacing: 8) {
                    VStack(spacing: 0) {
                        Menu {
                            Picker("Month", selection: $selectedMonth) {
                                ForEach(1...12, id: \.self) { month in
                                    Text(String(format: "%02d", month))
                                }
                            }
                        } label: {
                            Text(months[selectedMonth - 1])
                                .padding(.leading, -37)
                                .font(.custom("Outfit", size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(width: 114, height: 48)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        }
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color(red: 62/255, green: 62/255, blue: 64/255))
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.trailing, 8)
                            }
                        )
                    }
                    
                    TextField("DD", text: $day)
                        .padding()
                        .frame(width: 114, height: 48)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .font(.custom("Outfit", size: 16))
                        .fontWeight(.medium)
                    
                    TextField("YYYY", text: $year)
                        .padding()
                        .frame(width: 114, height: 48)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .font(.custom("Outfit", size: 16))
                        .fontWeight(.medium)
                }
                
                Text("Do you identify as?")
                    .font(.custom("Outfit SemiBold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.9))
                    .frame(height: 23)
                
                HStack(spacing: 8) {
                    ForEach(genders, id: \.self) { gender in
                        VStack {
                            genderIcons[gender]?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding()
                            Text(gender)
                                .font(.custom("Outfit", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(gender == selectedGender ? .white : .black)
                        }
                        .frame(width: 110, height: 110)
                        .background(gender == selectedGender ? genderColors[gender] : Color(.secondarySystemBackground))
                        .cornerRadius(16)
                        .onTapGesture {
                            selectedGender = gender
                        }
                    }
                }
            }
            .padding()
            .frame(width: 358)
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                    handleContinueButtonAction()
                    isSecondViewPresented = true
                })
                {
                    NavigationLink(destination: TellUsAboutYourselfView(userDetails: userDetails, name: firstName, DOB: "\(year)-\(month)-\(day)", gender: selectedGender),
                                   isActive: $isSecondViewPresented) {
                        Text("CONTINUE")
                            .font(.custom("Termina", size: 16, relativeTo: .body).weight(.bold))
                            .foregroundColor(.white)
                            .frame(width: 358, height: 48)
                            .background(Color(red: 119/255, green: 67/255, blue: 219/255))
                            .cornerRadius(8)
                            .offset(y: 30)
                            .onTapGesture {
                                if !firstName.isEmpty && !day.isEmpty && !year.isEmpty && !selectedGender.isEmpty {
                                    userDetails = UserDetails(firstName: firstName,
                                                              DOB: "\(year)-\(month)-\(day)",
                                                              gender: selectedGender)
                                    isSecondViewPresented = true
                                }
                                else {
                                    showErrorAlert = true
                                }
                            }
                    }
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
            .background(Color.white)
        }
        .navigationBarHidden(true)
    }
}

//#Preview {
//    tellUsAboutYourselfOne()
//}
