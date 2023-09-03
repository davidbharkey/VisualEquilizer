//
//  ButtonsView.swift
//  VisualEquilizer
//
//  Created by David Harkey on 9/3/23.
//

import SwiftUI

struct ButtonsView: View {
    @Binding var color: Color
    @Binding var useRainbowColors: Bool
    @Binding var useDarkMode: Bool
    
    var body: some View {
        GroupBox {
            HStack {
                ForEach([Color.red, .orange, .yellow, .green, .blue, .indigo, .purple], id: \.self) { color in
                    Button("  ") {
                        self.color = color
                    }
                    .clipShape(.circle)
                    .buttonStyle(.borderedProminent)
                    .tint(color)
                }
            }
            
            HStack {
                Toggle(isOn: $useRainbowColors) {
                    Capsule()
                        .fill(
                            LinearGradient(colors: Color.rainbow, startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 100, height: 25)
                }
                .toggleStyle(.button)
                
                Toggle(isOn: $useDarkMode) {
                    Image(systemName: "moonphase.last.quarter")
                        .font(.title)
                        .tint(.black)
                }
                .toggleStyle(.button)
            }
        }
    }
}
