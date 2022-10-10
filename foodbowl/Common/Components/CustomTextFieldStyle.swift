//
//  VisualComponents.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import Foundation
import SwiftUI

extension TextField {
    public func customTextFieldStyle() -> some View {
        self
            .textInputAutocapitalization(.words)
            .font(FBFonts.regular(size: 18))
            .padding([.top, .bottom], 12)
            .padding([.leading, .trailing], 8)
            .background {
                FBColors.lightGrayBackground
                    .cornerRadius(8)
            }
    }
}
