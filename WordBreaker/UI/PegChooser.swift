//
//  PegChooser.swift
//  WordBreaker
//
//  Created by Lora Zubić on 23.03.2026..
//

import SwiftUI

struct PegChooser: View {
    
    // MARK: Data Out Function
    let onChoose: ((Peg) -> Void)?
    
    private let row1: [Peg] = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    private let row2: [Peg] = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    private let row3: [Peg] = ["Z", "X", "C", "V", "B", "N", "M"]

    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 4) {
                ForEach(row1, id: \.self) { peg in
                    chooseButton(peg: peg)
                }
            }
            
            HStack(spacing: 4) {
                ForEach(row2, id: \.self) { peg in
                    chooseButton(peg: peg)
                }
            }
            
            HStack(spacing: 4) {
                ForEach(row3, id: \.self) { peg in
                    chooseButton(peg: peg)
                }
            }
        }
        .padding()
    }
    
    func chooseButton(peg: Peg) -> some View {
        Button {
            onChoose?(peg)
        } label: {
            Text(peg)
                .font(.system(size: 18, weight: .bold))
                .frame(width: 32, height: 44)
                .background(Color.blue.opacity(0.2))
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    PegChooser(onChoose: { peg in
        print("Odabrano slovo: \(peg)")
    })
}
