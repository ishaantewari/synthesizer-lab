import SwiftUI

typealias Scale = (min: Double, max: Double, increment: Double)

struct GraphedWave<Content: View>: View {
    var x: Scale
    var y: Scale
    
    var waveContent: () -> Content
    
    var body: some View {  
        HStack {
            Text("Pressure (relative)")
                .rotationEffect(.degrees(270), anchor: .center)
                .fixedSize()
                .frame(width: 20)
            
            VStack {
                Text(String(format: "%g", Double(y.max)))
                
                
                ForEach((0..<Int((y.max - y.min) / y.increment)).reversed(), id: \.self) { step in
                    Spacer()
                    
                    Text(String(format: "%g", y.min + (Double(step) * y.increment)))
                }
                
                ForEach(1...3, id: \.self) { _ in
                    Text("")
                }
            }
                
            
            VStack {
                
                ZStack {
                    WaveGrid(x: x, y: y)
                        .stroke(Color.gray, lineWidth: 1) 
                    
                    waveContent()
                    
                }
                
                
                HStack {
                    ForEach((0..<Int((x.max - x.min) / x.increment)), id: \.self) { step in
                        Text(String(format: "%g", x.min + (Double(step) * x.increment)))
                        
                        Spacer()
                    }
                    
                    Text(String(format: "%g", Double(x.max)))
                }
                
                Text("Time (relative)")
            }
        }
        
    }
}
