import SwiftUI

enum Interval {
    case octave
    case perfectFifth
    case perfectFourth
    case majorThird
}

func getRatio(int: Interval) -> Float {
    switch int {
    case .octave: return 2
    case .perfectFifth: return 3/2
    case .perfectFourth: return 4/3
    case .majorThird: return 5/4
    }
}

struct ExplorationD: View {
    @State private var phaseShift: Float = 0
    @State private var isToggled = false
    @State private var interval: Interval = .octave
    
    var body: some View {
        ScrollView(.vertical) {
            ExplorationTextView(title: "Harmony", titleGradient: [.teal, .cyan], text: [
                "You may be wondering why certain notes are assigned to seemingly random frequencies. Why does a 880Hz wave produce A5, for example? The answer is quite beautiful.",
                "Our human ears implicitly recognize mathematical relationships between waves. For example, the octave, a pair of notes 8 steps apart, sounds wonderful to our ears. This is because the upper note of the pair has exactly twice the frequency of the bottom note.",
                "Thus, if we define A4 to have a frequency of 440Hz, we can derive a range of other notes that sound pleasant to our ears. A5 is 880Hz because it is exactly two times the frequency of A4, which is 440Hz!",
                "Play with different intervals below! The number beside each interval name represents the ratio between the notes' frequencies. For example, the '2' besides octave means that the upper note is twice the frequency of the bottom note."
            ])
            
            HStack(spacing: 60) {
                
                VStack {
                    Text("Interval")
                        .tracking(1)
                    
                    Picker("Interval", selection: $interval) {
                        Text("Octave: 2").tag(Interval.octave)
                        Text("Perfect Fifth: 3/2").tag(Interval.perfectFifth)
                        Text("Minor Third: 4/3").tag(Interval.perfectFourth)
                        Text("Major Third: 5/4").tag(Interval.majorThird)
                    }
                    .pickerStyle(.menu)
                    
                }
                .italic()
                
                
                Button(action: {
                    if isToggled == false {
                        isToggled = true
                        
                        playSynth(waveFunction: WaveFunction.sine, frequencyInHz: Int(440 * getRatio(int: interval)), amplitude: 1, durationInMillis: 2_500, onPlay: {
                            
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
                    WavePath(oscillations: (4 * getRatio(int: interval)), amplitude: 30, waveFunction: WaveFunction.sine, phaseShift: phaseShift)
                }
                
            }
            .frame(minWidth: 300, maxWidth: 1030, minHeight: 300, maxHeight: 750)
            
        }
        .padding(10)
    }
}
