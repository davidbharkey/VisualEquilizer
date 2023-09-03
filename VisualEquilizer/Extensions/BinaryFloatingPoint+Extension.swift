//
//  BinaryFloatingPoint+Extension.swift
//  VisualEquilizer
//
//  Created by David Harkey on 9/3/23.
//

import Foundation

extension BinaryFloatingPoint {
    /// Normalization code courtesy of Michal Cichecki - https://gist.github.com/mcichecki
    /// Returns normalized value for the range between `a` and `b`
    /// - Parameters:
    ///   - min: minimum of the range of the measurement
    ///   - max: maximum of the range of the measurement
    ///   - a: minimum of the range of the scale
    ///   - b: minimum of the range of the scale
    func normalize(min: Self, max: Self, from a: Self = 0, to b: Self = 1) -> Self {
        (b - a) * ((self - min) / (max - min)) + a
    }
}
