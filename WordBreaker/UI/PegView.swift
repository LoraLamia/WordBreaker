//
//  PegView.swift
//  WordBreaker
//
//  Created by Lora Zubić on 23.03.2026..
//

import SwiftUI

struct PegView: View {
    
    // MARK: Data In
    let peg: Peg
    
    // MARK: - Body

    let pegShape = RoundedRectangle(cornerRadius: 10)
    
    init(peg: Peg) {
        self.peg = peg
    }
    
    var body: some View {
        Text(peg)
            .font(.system(size: 60))
            .minimumScaleFactor(12/60)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                pegShape
                    .strokeBorder(Color.primary.opacity(0.5), lineWidth: 2)
            }
    }
}

#Preview {
    HStack {
        PegView(peg: "A")
        PegView(peg: "B")
        PegView(peg: "")
        PegView(peg: "C")
        PegView(peg: "D")
    }
    .padding()
}

