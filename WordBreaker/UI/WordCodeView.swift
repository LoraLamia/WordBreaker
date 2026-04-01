//
//  WordCodeView.swift
//  WordBreaker
//
//  Created by Lora Zubić on 01.04.2026..
//

import SwiftUI

struct WordCodeView: View {
    // MARK: Data In
    let code: WordCode
    
    // MARK: Data shared with me
    @Binding var selectedIndex: Int
    
    init(code: WordCode, selectedIndex: Binding<Int> = .constant(-1)) {
        self.code = code
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(code.pegs.indices, id: \.self) { index in
                PegView(peg: code.pegs[index])
                    .overlay {
                        // Current peg highlighted
                        if selectedIndex == index && code.kind == .guess {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.blue, lineWidth: 3)
                        }
                    }
                    .contentShape(Rectangle())
                    // hidden master code overlay
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(code.isHidden ? Color.gray : .clear)
                            .transaction { transaction in
                                if code.isHidden {
                                    transaction.animation = nil
                                }
                            }
                    }
                    .onTapGesture {
                        if code.kind == .guess {
                            selectedIndex = index
                        }
                    }
            }
        }
    }
}


