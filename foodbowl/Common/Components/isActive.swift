//
//  isActive.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import SwiftUI

extension View {
    public func isActive(_ isActive: Binding<Bool>) -> some View {
        self
            .opacity(isActive.wrappedValue ? 1.0 : 0.6)
            .disabled(!isActive.wrappedValue)
    }
}
