//
//  MatchMarkers.swift
//  WordBreaker
//
//  Created by Lora Zubić on 20.03.2026..
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarker: View {
    let match: Match

    var body: some View {
        Circle()
            .fill(fillColor)
            .frame(width: 20, height: 20)
    }
    
    private var fillColor: Color {
        switch match {
        case .exact:
            return .green
        case .inexact:
            return .yellow
        case .nomatch:
            return .gray.opacity(0.3)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        MatchMarker(match: .exact)
        MatchMarker(match: .inexact)
        MatchMarker(match: .nomatch)
    }
    .padding()
}
