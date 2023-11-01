import SwiftUI

enum WaveShape {
    case sine
    case triangle
    case sawtooth
    case square
}

func getWaveFunction(w: WaveShape) -> (Float) -> Float {
    switch w {
    case .sine: return WaveFunction.sine
    case .triangle: return WaveFunction.triangle
    case .sawtooth: return WaveFunction.sawtooth
    case .square: return WaveFunction.square
    }
}

struct ExplorationE: View {
    @State private var phaseShift: Float = 0
    @State private var isToggled = false
    @State private var waveShape: WaveShape = .sine
    
    var body: some View {
        ScrollView(.vertical) {
            ExplorationTextView(title: "Timbre", titleGradient: [.blue, .indigo], text: [
                "Up until this point, we have only looked at the sounds produced by sine waves. But what happens if we use different wave shapes? We get new, unique sounds!",
                "Warning: some of the other wave shapes sound pretty nasty on their own, so keep your volume at a reasonable level :)"
            ])
            
            HStack(spacing: 60) {
                
                VStack {
                    Text("Wave Shape")
                        .tracking(1)
                    
                    Picker("Wave Shape", selection: $waveShape) {
                        Text("Sine").tag(WaveShape.sine)
                        Text("Triangle").tag(WaveShape.triangle)
                        Text("Square").tag(WaveShape.square)
                        Text("Sawtooth").tag(WaveShape.sawtooth)
                    }
                    .pickerStyle(.menu)
                    
                }
                .italic()
                
                
                Button(action: {
                    if isToggled == false {
                        isToggled = true
                        
                        playSynth(waveFunction: getWaveFunction(w: waveShape), frequencyInHz: 440, amplitude: 1, durationInMillis: 2_500, onPlay: {
                            
                            withAnimation(.linear(duration: 1).repeatCount(5, autoreverses: false)) {
                                self.phaseShift = twoPi
                            }
                            
                        }, onCompletion: {
                            isToggled = false
                            withAnimation(.default) {
                                self.phaseShift = 0
                            }
                        })
                        
                    }
                }, label: {
                    Text("Play")
                })
                
                .font(.title2)
                .tracking(1)
                .foregroundColor(.black)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isToggled ? .mint : .green)
                )
            }
            
            
            .padding(24)
            .frame(minWidth: 300, maxWidth: 1030)
            
            
            GraphedWave(x: (min: 0, max: 1, increment: 0.25), y: (min: -1, max: 1, increment: 0.5)) {
                
                ColoredWave(colors: [.teal, .cyan], thickness: 5) {
                    WavePath(oscillations: 4, amplitude: 30, waveFunction: getWaveFunction(w: waveShape), phaseShift: phaseShift)
                }
                
            }
            .frame(minWidth: 300, maxWidth: 1030, minHeight: 300, maxHeight: 750)
            
        }
        .padding(10)
    }
}
