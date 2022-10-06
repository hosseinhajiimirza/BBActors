//
//  ColorExtensions.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

extension Color {
    static var random: Color {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1)
    }
}
