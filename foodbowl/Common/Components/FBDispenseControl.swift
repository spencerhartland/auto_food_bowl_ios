//
//  FBDispenseControl.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

public struct FBDispenseControl: View {
    @State var sliderValue: Double = 3.0
    
    private let requestHandler = FBRequestHandler()
    
    public var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Slider(
                        value: $sliderValue,
                        in: 3...9,
                        step: 3
                    )
                    .accentColor(.black)
                    
                    HStack {
                        VStack {
                            FoodIcon(amount: 1)
                            Text("SNACK")
                                .offset(y: 4)
                        }
                        Spacer()
                        VStack {
                            FoodIcon(amount: 2)
                            Text("LARGE SNACK")
                                .offset(y: 4)
                        }
                        .offset(x: -4)
                        Spacer()
                        VStack {
                            FoodIcon(amount: 3)
                            Text("MEAL")
                        }
                    }
                    .font(FBFonts.bold(size: 12))
                }
                .padding(.trailing, 8)
                Button {
                    let revolutions = String(format: "%.0f", sliderValue)
                    requestHandler.dispenseFood(value: revolutions) { success in
                        if success {
                            print("yay")
                        } else {
                            print("boo")
                        }
                    }
                } label: {
                    Text("DISPENSE")
                        .foregroundColor(.white)
                        .font(FBFonts.medium(size: 16))
                        .padding(.vertical, 32)
                        .frame(width: 120)
                        .background {
                            Color.black
                                .cornerRadius(8)
                        }
                }
            }
            .padding(.all, 16)
            .background {
                FBColors.lightGrayBackground
                    .cornerRadius(12)
            }
        }
    }
}

private struct FoodIcon: View {
    let amount: Int
    
    private static let size: CGFloat = 6
    private let circle: some View = {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: size, height: size)
    }()
    
    var body: some View {
        switch amount {
        case 1:
            circle
        case 2:
            HStack(spacing: 2) {
                circle
                circle
            }
        default:
            VStack(spacing: 2) {
                circle
                HStack(spacing: 2) {
                    circle
                    circle
                }
            }
        }
    }
}

struct FBDispenseControl_Previews: PreviewProvider {
    static var previews: some View {
        return FBDispenseControl()
    }
}
