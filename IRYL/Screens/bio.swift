import SwiftUI
import Foundation

struct BioView: View {
    @State private var bio: String = ""
    @State private var selectedEmoji: String? = "😐" 
    @Environment(\.presentationMode) var presentationMode
    var name:String
    var DOB:String
    var gender:String
    var height: Double
    var drinkHabit: Double
    var smokeHabit: Double
    var exerciseHabit: Double
    
    
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
                    .offset(x:-170, y:-130)
                }
                TitleView(screen: "three")
                    .frame(height: 120)
                    .padding(.top, 40)
                    .offset(x:0,y:-200)
                HStack(alignment: .top, spacing: 16) {
                    Text("Craft your bio here: Be genuine, be brief, and let your unique self spark curiosity")
                        .font(.custom("Outfit", size: 14))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y:-5)
                    
                }
                .padding([.top, .leading, .trailing], 24)
                .padding([.bottom], 16)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "7743DB"), Color(hex: "4C2B8C")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .offset(x:0, y:-123)
                Text("😎")
                    .font(.custom("Outfit", size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.init(hex: "222222"))
                    .offset(x:0, y:-245)
                Text("Bio")
                    .font(.custom("Outfit", size: 18, relativeTo: .body).bold())
                    .foregroundColor(.black.opacity(0.9))
                    .padding(.leading)
                    .offset(x:-170, y:-180)
                
                ZStack(alignment: .topTrailing) {
                    TextField("Max. 150 characters", text: $bio)
                        .font(.custom("Outfit", size: 16))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .offset(x:0,y:-190)
                    HStack(spacing: 10) {
                        Divider()
                            .frame(width: 130, height: 1)
                            .background(Color(red: 0.9529, green: 0.9529, blue: 0.9529))
                            .offset(x:10)
                        
                        Text("or as you can")
                            .font(.custom("Outfit Regular", size: 14))
                            .foregroundColor(.black)
                            .padding(8)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.init(hex: "FBFBFB"), lineWidth: 0.2)
                            )
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                        
                        Divider()
                            .frame(width: 130, height: 1)
                            .background(Color(red: 0.9529, green: 0.9529, blue: 0.9529))
                            .offset(x:-10)
                    }
                    .frame(maxWidth: .infinity)
                    .offset(x:0,y:-100)
                }
                Text("Describe yourself as an emoji")
                    .font(.custom("Outfit", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#222222"))
                    .offset(y:-120)
                
                HStack(spacing: 8) {
                    EmojiOption(emoji: "😄", label: "Extrovert", backgroundColor: selectedEmoji == "😄" ? Color.init(hex: "#55AEF2") : Color.init(hex: "#FEF3E4"), textColor: selectedEmoji == "😄" ? Color.init(hex: "#FFFFFF") : Color.init(hex: "#222222"))
                        .onTapGesture {
                            selectedEmoji = "😄"
                        }
                    EmojiOption(emoji: "😐", label: "Ambivert", backgroundColor: selectedEmoji == "😐" ? Color.init(hex: "#55AEF2") : Color.init(hex: "#FEF3E4"), textColor: selectedEmoji == "😐" ? Color.init(hex: "#FFFFFF") : Color.init(hex: "#222222"))
                        .onTapGesture {
                            selectedEmoji = "😐"
                        }
                    EmojiOption(emoji: "😔", label: "Introvert", backgroundColor: selectedEmoji == "😔" ? Color.init(hex: "#55AEF2") : Color.init(hex: "#FEF3E4"), textColor: selectedEmoji == "😔" ? Color.init(hex: "#FFFFFF") : Color(hex: "#222222"))
                        .onTapGesture {
                            selectedEmoji = "😔"
                        }
                }
                .offset(y:-120)
                
            }
            .offset(y:100)
            Button(action: {
                sendPostRequest()
            }) {
                Text("CONTINUE")
                    .font(.custom("Termina", size: 16, relativeTo: .body).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 119/255, green: 67/255, blue: 219/255))
                    .cornerRadius(8)
                    .offset(y:10)
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func jsonStringWithObject(obj: Any) -> Any {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: [])
            return jsonData
        } catch let error {
            print("Error creating JSON data: \(error.localizedDescription)")
            return {}
        }
    }
    
    private func sendPostRequest() {
        guard let url = URL(string: "https://iryl-backend.onrender.com/register") else {
            print("Invalid URL")
            return
        }

        let postData: [String: Any] = [
            "bio": bio,
            "emoji": selectedEmoji,
            "userDetails": [
                "firstName": name,
                "DOB": DOB,
                "gender": gender
            ],
            "userHobby": [
                "height": height,
                "drinkHabit": drinkHabit,
                "smokeHabit": smokeHabit,
                "exerciseHabit": exerciseHabit
            ]
        ]

        do {
            let jsonData = jsonStringWithObject(obj: postData)
                print(jsonData)
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
            request.httpBody = jsonData as! Data
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode != 200 {
                            print("Server error: \(httpResponse.statusCode)")
                            if let data = data {
                                let responseString = String(data: data, encoding: .utf8)
                                print("Response: \(String(describing: responseString))")
                            }
                            return
                        }
                    }
                    
                    if let data = data {
                        let responseString = String(data: data, encoding: .utf8)
                        print("Response: \(String(describing: responseString))")
                    }
                }.resume()
            }
    }

}

