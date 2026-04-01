//
//  WordBreakerView.swift
//  WordBreaker
//
//  Created by Lora Zubić on 20.03.2026..
//

import SwiftUI

struct WordBreakerView: View {
    @Environment(\.words) var words
    @State private var game: WordBreaker
    @State private var selectedPegIndex: Int = 0
    
    init() {
        // UI odabire random rijec i prosljeduje je modelu
        let randomLength = Int.random(in: 3...6)
        let masterWord = Words.shared.random(length: randomLength) ?? "SWIFT"
        self._game = State(initialValue: WordBreaker(masterWord: masterWord))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            WordCodeView(code: game.masterCode)
            
            Divider()
            
            ScrollView {
                // Current guess
                if !game.isOver {
                    HStack {
                        WordCodeView(code: game.guess, selectedIndex: $selectedPegIndex)
                        
                        // Guess button
                        Button("Guess") {
                            game.attemptGuess()
                            selectedPegIndex = 0 // Reset selection nakon guess-a
                        }
                        .disabled(game.guess.pegs.contains(WordCode.missingPeg))
                    }
                }
                // Attempts
                VStack(spacing: 10) {
                    ForEach(game.attempts.indices, id: \.self) { index in
                        WordCodeView(code: game.attempts[index])
                    }
                }
            }
            
            Divider()
            
            PegChooser { peg in
                game.setGuessPeg(peg, at: selectedPegIndex)
                selectedPegIndex = (selectedPegIndex + 1) % game.masterCode.pegs.count
            }
            
            // Restart button
            Button("Restart") {
                let randomLength = Int.random(in: 3...6)
                if let masterWord = words.random(length: randomLength) {
                    game.restartGame(masterWord: masterWord)
                    selectedPegIndex = 0 // Reset selection
                }
            }
        }
        .padding()
    }
}

#Preview {
    WordBreakerView()
        .environment(\.words, .shared)
}
