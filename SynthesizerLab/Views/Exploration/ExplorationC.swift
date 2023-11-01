import SwiftUI

struct ExplorationC: View {
    @State private var phaseShift: Float = 0
    @State private var isToggled = false
    @State private var frequency: Float = 440
    
    var body: some View {
        ScrollView(.vertical) {
            ExplorationTextView(title: "Frequency", titleGradient: [.mint, .green], text: [
                "The frequency of a wave also affects the sound. Frequency is the rate of oscillation with respect to time; a higher frequency results in more oscillations, and a lower frequency results less. Frequency is often measured in Hz, or oscillations per second.",
                "The higher the frequency of a wave, the higher its resulting pitch. Thus, each individual note corresponds to its own frequency: a 440Hz wave will produce the note A4, while a 523.25 Hz wave will produce C5, a higher pitched note. Any note from any instrument can be assigned a frequency!",
                "Test this out in the lab below!"
            ])
            
            HStack {
                
                VStack {
                    Text("Frequency (Hz)")
                        .tracking(1)
                    HStack {
                        Text("220")
                        Slider(value: $frequency, in: 220...880)
                        Text("880")
                    }
                }
                .italic()
                .padding(24)
                
                
                Button(action: {
                    if isToggled == false {
                        isToggled = true
                        
                        playSynth(waveFunction: WaveFunction.sine, frequencyInHz: Int(frequency), amplitude: 1, durationInMillis: 2_500, onPlay: {
                            
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
                
                ColoredWave(colors: [.mint, .green], thickness: 5) {
                    WavePath(oscillations: 4 * (frequency / 440), amplitude: 30, waveFunction: WaveFunction.sine, phaseShift: phaseShift)
                }
                
            }
            .frame(minWidth: 300, maxWidth: 1030, minHeight: 300, maxHeight: 750)
            
        }
        .padding(10)
    }
}
