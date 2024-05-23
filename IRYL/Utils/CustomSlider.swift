import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var step: Double
    
    var body: some View {
        if(value==1)
        {
            Slider(value: $value, in: range, step: step)
                .overlay(
                    Image(.no)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .offset(x: thumbOffset(value: value-1.0, range: range)+12)
                        .allowsHitTesting(false)
                )
        }
        else if(value==2)
        {
            Slider(value: $value, in: range, step: step)
                .overlay(
                    Image(.cigg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .offset(x: thumbOffset(value: value-1.0, range: range)-16, y:-5)
                        .allowsHitTesting(false)
                )
        }
        if(value==0)
        {
            Slider(value: $value, in: range, step: step)
                .overlay(
                    Image(.what)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .offset(x: thumbOffset(value: value-1.0, range: range)+42)
                        .allowsHitTesting(false)
                )
        }
    }
    
    private func thumbOffset(value: Double, range: ClosedRange<Double>) -> CGFloat {
        let width = UIScreen.main.bounds.width - 32
        let max = range.upperBound
        let min = range.lowerBound
        let percent = Double((value - min) / (max - min))
        return CGFloat(percent * width - (24 / 2))
    }
}
