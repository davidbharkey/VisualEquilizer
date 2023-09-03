//
//  ContentView.swift
//  VisualEquilizer
//
//  Created by David Harkey on 9/3/23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var data: [DataItem] = Array(repeating: .init(value: 0, color: .white), count: 50)
    @State private var data2: [DataItem] = Array(repeating: .init(value: 0, color: .white), count: 50)
    @State private var data3: [DataItem] = Array(repeating: .init(value: 0, color: .white), count: 50)
    
    @State private var color: Color = .green
    @State private var useRainbowColors: Bool = false
    @State private var useDarkMode: Bool = false
    
    let equilizerHeight: CGFloat = 100
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Equilizer(data: data)
                    .frame(height: equilizerHeight)
                    .padding(.horizontal)

                Equilizer(data: data2)
                    .frame(height: equilizerHeight / 2)
                    .padding(.horizontal)

                Equilizer(data: data3)
                    .frame(height: equilizerHeight / 0.75)
                    .padding(.horizontal)
                
                
                ButtonsView(color: $color, useRainbowColors: $useRainbowColors, useDarkMode: $useDarkMode)
                
            }
            .preferredColorScheme(useDarkMode ? .dark : .light)
            .navigationTitle("Visual Equilizer Demo")
            .onReceive(timer, perform: { _ in
                withAnimation {
                    if useRainbowColors, let col = Color.rainbow.randomElement() {
                        color = col
                    }
                    data.remove(at: 0)
                    data.append(.generateRandomDataItem(equalized: equilizerHeight, with: color))
                    
                    data2.remove(at: 0)
                    data2.append(.generateRandomDataItem(equalized: equilizerHeight / 2, with: color))
                    
                    data3.remove(at: 0)
                    data3.append(.generateRandomDataItem(equalized: equilizerHeight / 0.75, with: color))
                }
        })
        }
    }
    
}

#Preview {
    ContentView()
}
