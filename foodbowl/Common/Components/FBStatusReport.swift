//
//  FBStatusReport.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import SwiftUI

struct FBStatusReport: View {
    
    @State var previousMealTime: Date
    @State var nextMealTime: Date
    @State var foodStorage: Double
    @State private var foodLevel: String = "Low"
    @State private var alertColor: Color = .red
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(alertColor)
                    .font(.system(size: 14))
                    .offset(y: -1)
                Text("Status")
                    .font(FBFonts.semibold(size: 24))
                Spacer()
            }
            VStack(spacing: 12) {
                HStack {
                    // PREVIOUS MEAL TIME
                    HStack {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.system(size: 16))
                        Text(previousMealTime, style: .time)
                            .font(FBFonts.semibold(size: 18))
                    }
                    .padding(.horizontal, 8)
                    .background {
                        Color.white
                            .opacity(0.4)
                            .cornerRadius(4)
                    }
                    Spacer()
                    // NEXT MEAL TIME
                    HStack {
                        Image(systemName: "timer")
                            .font(.system(size: 16))
                        Text(nextMealTime, style: .time)
                            .font(FBFonts.semibold(size: 18))
                    }
                    .padding(.horizontal, 8)
                    .background {
                        Color.white
                            .opacity(0.4)
                            .cornerRadius(4)
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Food Storage")
                            .font(FBFonts.semibold(size: 18))
                        Text(foodLevel)
                            .foregroundColor(alertColor)
                            .font(FBFonts.medium(size: 16))
                            .padding(.horizontal, 4)
                            .background {
                                alertColor
                                    .opacity(0.2)
                                    .cornerRadius(2)
                            }
                    }
                    ProgressView(value: foodStorage)
                        .tint(.black)
                }
                .padding()
                .background {
                    Color.white
                        .opacity(0.4)
                        .cornerRadius(8)
                }
            }
            .padding(.all, 16)
            .background {
                FBColors.lightGrayBackground
                    .cornerRadius(12)
            }
        }
        .onChange(of: foodStorage) { _ in
            updateStatus()
        }
        .onAppear {
            updateStatus()
        }
    }
    
    private func updateStatus() {
        if foodStorage < 0.25 {
            foodLevel = "Low"
            alertColor = .red
        } else if foodStorage > 0.25 {
            foodLevel = String(format: "%.0f%%", (foodStorage * 100.0))
            alertColor = .green
        }
    }
}

struct FBStatusReport_Previews: PreviewProvider {
    static var previews: some View {
        FBStatusReport(previousMealTime: Date(), nextMealTime: Date(), foodStorage: 0.6)
    }
}
