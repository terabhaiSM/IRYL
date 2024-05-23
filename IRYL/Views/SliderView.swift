import SwiftUI

struct SliderView : View {
    @State var leftHandleViewState = CGSize.init(width: 0, height: 0)
    @State var rightHandleViewState = CGSize.init(width: 0, height: 0)
    @State var heightleft = 100
    @State var heightright = 200
    @State private var height = ""
    @State var heightleftChanged = false
    @State var heightrightChanged = false
    
    var body: some View {
        let leftHandleDragGesture = DragGesture(minimumDistance: 1, coordinateSpace: .local)
            .onChanged { value in
                guard value.location.x >= 0 && value.location.x<323 else {
                    return
                }
                //                print(value)
                self.leftHandleViewState.width = value.location.x
                heightleft=Int(100 / 323 * value.location.x + 100)
                print(heightleft)
                heightleftChanged = true
            }
        let rightHandleDragGesture = DragGesture(minimumDistance: 1, coordinateSpace: .local)
            .onChanged { value in
                guard value.location.x <= 0 && value.location.x > (-323) else {
                    return
                }
                //                print(value)
                self.rightHandleViewState.width = value.location.x
                heightright=Int(100 / 323 * value.location.x + 200)
                print("heightright",heightright)
                heightrightChanged = true
            }
        return
        VStack(spacing:0){
            HStack {
                Text("Height")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black.opacity(0.9))
                Spacer()
                if heightleftChanged == false && heightrightChanged == false
                {
                    Text("Open to any")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.init(hex: "9F9F9F"))
                }
                else if(heightleftChanged)
                {
                    Text("Shorter than \(String($heightleft.wrappedValue))m")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.init(hex: "9F9F9F"))
                }
                else if(heightrightChanged)
                {
                    Text("Taller than \(String($heightright.wrappedValue))m")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.init(hex: "9F9F9F"))
                }
            }
            .padding([.leading, .trailing], 5)
            HStack(spacing: 0) {
                Circle()
                    .fill(Color.init(hex: "7743DB"))
                    .frame(width: 24, height: 24, alignment: .center)
                    .offset(x: leftHandleViewState.width, y: 0)
                    .gesture(leftHandleDragGesture)
                    .zIndex(1)
                Rectangle()
                    .frame(width: CGFloat(300.0), height: CGFloat(3.0), alignment: .center)
                    .zIndex(0)
                    .foregroundColor(.purple)
                Circle()
                    .fill(Color.init(hex: "7743DB"))
                    .frame(width: 24, height: 24, alignment: .center)
                    .offset(x: rightHandleViewState.width, y: 0)
                    .gesture(rightHandleDragGesture)
                    .zIndex(1)
            }
            .padding(10)
        }
    }
}

