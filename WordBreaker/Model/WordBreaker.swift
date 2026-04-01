//
//  WordBreaker.swift
//  CodeBreaker
//
//  Created by Lora Zubić on 03.03.2026..
//

typealias Peg = String

struct WordBreaker {
    var masterCode: WordCode
    var guess: WordCode
    var attempts: [WordCode] = []
    var pegChoices: [Peg]
    var wordLength: Int
    
    init(masterWord: String) {
        wordLength = masterWord.count
        pegChoices = "QWERTYUIOPASDFGHJKLZXCVBNM".map { String($0) }
        masterCode = WordCode(kind: .master(isHidden: true), numberOfPegs: wordLength)
        masterCode.word = masterWord.uppercased()
        guess = WordCode(kind: .guess, numberOfPegs: wordLength)
    }
    
    mutating func restartGame(masterWord: String) {
        wordLength = masterWord.count
        masterCode = WordCode(kind: .master(isHidden: true), numberOfPegs: wordLength)
        masterCode.word = masterWord.uppercased()
        guess = WordCode(kind: .guess, numberOfPegs: wordLength)
        attempts.removeAll()
    }
    
    var isOver: Bool {
        attempts.last?.pegs == masterCode.pegs
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        
        for pastAttempt in attempts {
            if pastAttempt.pegs == attempt.pegs {
                return
            }
        }
        
        for peg in guess.pegs {
            if peg == WordCode.missingPeg {
                return
            }
        }
        
        attempts.append(attempt)
        guess.reset()
        
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guard guess.pegs.indices.contains(index) else { return }
        guess.pegs[index] = peg
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? WordCode.missingPeg
        }
        
    }

}



