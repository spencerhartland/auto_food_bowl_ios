//
//  FBLogo.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

public struct FBLogo: View {
    let size: CGFloat
    
    public var body: some View {
        HStack {
            Image(systemName: "pawprint.circle.fill")
                .resizable()
                .frame(width: size, height: size)
            Text("cyberbowl")
                .font(.custom("Rajdhani-SemiBold", size: size))
        }
    }
}
