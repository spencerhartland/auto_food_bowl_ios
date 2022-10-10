//
//  FBLargeButton.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

public struct FBLargeButton: View {
    let title: String
    let systemImageName: String?
    let action: () -> Void
    
    init(title: String, image: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.systemImageName = image
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .cornerRadius(10)
                HStack {
                    Text(title)
                        .font(FBFonts.medium(size: 22))
                    if let name = systemImageName {
                        Image(systemName: name)
                            .resizable()
                            .frame(width: 14, height: 14)
                            .padding(.bottom, 2)
                    }
                }
                .foregroundColor(.white)
            }
        }
    }
    
    public func isActive(_ isActive: Binding<Bool>) -> some View {
        self
            .opacity(isActive.wrappedValue ? 1.0 : 0.6)
            .disabled(!isActive.wrappedValue)
    }
}
