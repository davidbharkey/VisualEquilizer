//
//  Equilizer.swift
//  VisualEquilizer
//
//  Created by David Harkey on 9/3/23.
//

import SwiftUI
import Combine

struct Equilizer: View {
    let data: [DataItem]
    let lightModeBackground: Color
    let darkModeColor: Color
    
    init(data: [DataItem], lightModeBackground: Color = .black, darkModeColor: Color = .blue) {
        self.data = data
        self.lightModeBackground = lightModeBackground
        self.darkModeColor = darkModeColor
    }
    
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        ZStack {
            if scheme == .light {
                Capsule()
                    .fill(lightModeBackground.gradient.opacity(0.9))
            } else {
                Capsule()
                    .fill(darkModeColor.gradient.opacity(1))
            }
            
            HStack(spacing: 2) {
                ForEach(data) { data in
                    Capsule()
                        .fill(data.color.gradient)
                        .frame(height: data.value.normalize(min: 0, max: 100, from: 0, to: 80))
                }
            }
            .background(.clear)
            .padding(.horizontal, 5)
            .clipShape(.capsule)
        }
        .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
    }
}

#Preview {
    ContentView()
}
