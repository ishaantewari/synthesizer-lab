import SwiftUI

struct ExplorationB: View {
    @State private var phaseShift: Float = 0
    @State private var isToggled = false
    @State private var amplitude: Float = 0.5
    
    var body: some View {
        ScrollView(.vertical) {
            ExplorationTextView(title: "Amplitude", titleGradient: [.orange, .yellow], text: ["The mathematical properties of sound waves are directly linked to their physical attributes. In other words, by changing the way a wave looks when graphed, we intrinsically change the sound that is produced. Cool, right?",
              "Let’s begin by looking at amplitude. Amplitude refers to the height of the wave—specifically, how high the crests are and how low the troughs are. A greater amplitude creates a louder sound, and a smaller amplitude creates a quieter sound.",
               "This makes sense from a scientific perspective. If a wave has greater amplitude, it has a greater variation in pressure over each oscillation (remember, the y-axis represents pressure). Thus, a wave with greater amplitude will require more energy to generate this increased variation in pressure, just as more energy is required to produce a louder sound. Energy is conserved in this process.",
                "Play with the amplitude slider below, and observe the changes in volume by hitting the play button! Make sure to press play after you've adjusted the slider to the desired value :)"])
            
            HStack {
                
                VStack {
                    Text("Amplitude")
                        .tracking(1)
                    HStack {
                        Text("0")
                        Slider(value: $amplitude, in: 0...1)
                        Text("1")
                    }
                }
                .italic()
                .padding(24)
                
                
                Button(action: {
                    if isToggled == false {
                        isToggled = true
                        
                        playSynth(waveFunction: WaveFunction.sine, frequencyInHz: 440, amplitude: amplitude, durationInMillis: 2_500, onPlay: {
                            
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
                
                ColoredWave(colors: [.orange, .yellow], thickness: 5) {
                    WavePath(oscillations: 4, amplitude: (amplitude * 60), waveFunction: WaveFunction.sine, phaseShift: phaseShift)
                }
                
            }
            .frame(minWidth: 300, maxWidth: 1030, minHeight: 300, maxHeight: 750)
            
        }
        .padding(10)
    }
}
