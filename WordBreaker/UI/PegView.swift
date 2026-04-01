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
    let match: Match?
    
    // MARK: - Body

    let pegShape = RoundedRectangle(cornerRadius: 10)
    
    init(peg: Peg, match: Match? = nil) {
        self.peg = peg
        self.match = match
    }
    
    var body: some View {
        VStack(spacing: 4) {
            if let match {
                MatchMarker(match: match)
            }
            Text(peg)
                .font(.system(size: 60))
                .minimumScaleFactor(12/60)
        }
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

