//
//  FBLEDColorPicker.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import SwiftUI

struct FBLEDColorPicker: View {
    @State var color: CGColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
    
    private let requestHandler = FBRequestHandler()
    
    var body: some View {
        HStack {
            ColorPicker(selection: $color, supportsOpacity: false) {
                HStack {
                    Image(systemName: "light.beacon.min.fill")
                        .font(.system(size: 14))
                    Text("LED Color")
                        .foregroundColor(.black)
                        .font(FBFonts.medium(size: 16))
                        .offset(y: 2)
                }
            }
            .padding(8)
            .background {
                Color.white
                    .opacity(0.4)
                    .frame(height: 44)
                    .cornerRadius(6)
            }
            .padding(.trailing, 8)
            Button {
                guard let components = self.color.components else {
                    return
                }
                let red = String(format: "%.0f", components[0] * 100)
                let green = String(format: "%.0f", components[1] * 100)
                let blue = String(format: "%.0f", components[2] * 100)
                requestHandler.setLEDColor(r: red, g: green, b: blue) { success in
                    if success {
                        print("Set LED color successfully!")
                    }
                }
            } label: {
                Text("SET COLOR")
                    .foregroundColor(.white)
                    .font(FBFonts.medium(size: 16))
                    .frame(width: 120)
                    .background {
                        Color.black
                            .frame(width: 120, height: 44)
                            .cornerRadius(6)
                            .scaledToFill()
                    }
            }
        }
        .padding(16)
        .background {
            FBColors.lightGrayBackground
                .cornerRadius(12)
        }
    }
}

struct FBLEDColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        FBLEDColorPicker()
    }
}
