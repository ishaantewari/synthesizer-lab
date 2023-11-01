import SwiftUI

struct ExplorationA: View {
    @State private var phaseShift: Float = 0
    @State private var isToggled = false
    
    var body: some View {
        ScrollView(.vertical) {
            ExplorationTextView(title: "What is a sound wave?", titleGradient: [.red, .purple], text: [
                "A sound wave is an oscillating variation in the pressure of a medium, especially air. To conceptualize a sound wave, it may be helpful to think of a slinky. If one were to push one end of the slinky back and forth, the variation in applied pressure would produce a wave that travels the length of the coils.",
                "While humans unfortunately cannot hear slinky waves (though that would be fun), we can hear waves that travel across other mediums. In the case of sound waves, we generally hear waves that propagate through air.",
                "Sound waves are a wonderfully complex field of science--they tie mathematics, physics, and music theory into one tightly-knit tapestry. Given the complexity of these waves, it seems astounding that we can create sounds so easily on our relatively tiny devices. The speaker in your device does not magically produce sound from thin air; it vibrates at a precise rate and intensity, producing just the right distortions in pressure at just the right times. Given how complex producing just one note seems, imagine how complicated it is to play a simple song with various different instruments creating different waves at different frequencies and intensities. There is so much science that goes into something as seemingly simple as a speaker!",
                "In the lab below, you can simulate the propagation of a sine wave. When you press play, your device’s speakers will change the pressure according to the rate determined by the sine wave. The frequency of this wave is 440Hz, or 440 oscillations per second. Note that there may be a brief delay!"
            ])
            
            Button(action: {
                if isToggled == false {
                    isToggled = true
                    
                    playSynth(waveFunction: WaveFunction.sine, frequencyInHz: 440, amplitude: 1, durationInMillis: 2_500, onPlay: {
                        
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
            
            
            .padding(24)

            
            GraphedWave(x: (min: 0, max: 1, increment: 0.25), y: (min: -1, max: 1, increment: 0.5)) {
                
                ColoredWave(colors: [.red, .purple], thickness: 5) {
                    WavePath(oscillations: 4, amplitude: 30, waveFunction: WaveFunction.sine, phaseShift: phaseShift)
                }
                
            }
            .frame(minWidth: 300, maxWidth: 1030, minHeight: 300, maxHeight: 750)
            
        }
        .padding(10)
    }
}
