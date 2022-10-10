//
//  FBConnectionStatus.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

public enum Status: String {
    case connected
    case offline
    case checking
}

struct FBConnectionStatus: View {
    @Binding var status: Status
    
    private let imageSize: CGFloat = 12
    private let textSize: CGFloat = 14
    
    var body: some View {
        HStack(spacing: 6) {
            switch status {
            case .connected:
                Image(systemName: "wifi")
                    .font(FBFonts.medium(size: imageSize))
                    .foregroundColor(.green)
                Text("Connected")
                    .font(FBFonts.semibold(size: textSize))
                    .foregroundColor(FBColors.darkGrayText)
                    .offset(y: 2)
            case .offline:
                Image(systemName: "wifi.slash")
                    .font(FBFonts.medium(size: imageSize))
                    .foregroundColor(.red)
                Text("Offline")
                    .font(FBFonts.semibold(size: textSize))
                    .foregroundColor(FBColors.darkGrayText)
                    .offset(y: 2)
            case .checking:
                Image(systemName: "wifi")
                    .font(FBFonts.medium(size: imageSize))
                    .foregroundColor(.yellow)
                Text("Testing connection...")
                    .font(FBFonts.semibold(size: textSize))
                    .foregroundColor(FBColors.darkGrayText)
                    .offset(y: 2)
            }
        }
        .padding(.bottom, 2)
        .padding([.leading, .trailing], 6)
        .background {
            FBColors.lightGrayBackground
                .cornerRadius(4)
        }
    }
}

struct ConnectionStatus_Previews: PreviewProvider {
    static var previews: some View {
        FBConnectionStatus(status: .constant(.checking))
    }
}
