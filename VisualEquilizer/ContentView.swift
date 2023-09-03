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
    let equilizerHeight: CGFloat = 100
    
    var body: some View {
        VStack(spacing: 0) {
            Equilizer(data: data)
                .frame(maxHeight: equilizerHeight)
                .padding(.horizontal)
            
            
        }
        .onReceive(timer, perform: { _ in
            withAnimation {
                data.remove(at: 0)
                data.append(.generateRandomDataItem(equalized: equilizerHeight))
            }
        })
    }
    
}

#Preview {
    ContentView()
}
