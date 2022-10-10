//
//  Fonts.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import Foundation
import SwiftUI

public struct FBFonts {
    public static let onboardingTitle = Font.custom("Rajdhani-Bold", size: 80)
    public static let title = Font.custom("Rajdhani-Bold", size: 38)
    public static let subtitle = Font.custom("Rajdhani-SemiBold", size: 24)
    public static let footer = Font.custom("Rajdhani-Medium", size: 12)
    // Rajdhani-Bold
    public static func bold(size: CGFloat) -> Font {
        return Font.custom("Rajdhani-Bold", size: size)
    }
    // Rajdhani-Light
    public static func light(size: CGFloat) -> Font {
        return Font.custom("Rajdhani-Light", size: size)
    }
    // Rajdhani-Medium
    public static func medium(size: CGFloat) -> Font {
        return Font.custom("Rajdhani-Medium", size: size)
    }
    // Rajdhani-Regular
    public static func regular(size: CGFloat) -> Font {
        return Font.custom("Rajdhani-Regular", size: size)
    }
    // Rajdhani-SemiBold
    public static func semibold(size: CGFloat) -> Font {
        return Font.custom("Rajdhani-SemiBold", size: size)
    }
}
