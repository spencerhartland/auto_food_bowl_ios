//
//  FBControl.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

public struct FBControl: View {
    let title: String
    let systemImageName: String
    let action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Image(systemName: systemImageName)
                    .font(.system(size: 14))
                Text(title)
                    .font(FBFonts.semibold(size: 16))
                    .offset(y: 2)
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .frame(height: 44)
            .foregroundColor(.black)
            .background {
                FBColors.lightGrayBackground
                    .cornerRadius(12)
            }
        }
    }
}
