//
//  DataItem.swift
//  VisualEquilizer
//
//  Created by David Harkey on 9/3/23.
//

import SwiftUI

struct DataItem: Identifiable {
    let id = UUID()
    let value: CGFloat
    let color: Color
    
    static func generateRandomDataItem(equalized to: CGFloat) -> DataItem {
        return DataItem(
            value: CGFloat
                .random(in: 1...1000)
                .normalize(
                    min: 0,
                    max: 1000,
                    from: 1,
                    to: to
                ),
            color: .green   // .rainbow.randomElement()!
        )
    }
}
