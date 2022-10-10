//
//  FBQuickControls.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import Foundation
import SwiftUI

public struct FBQuickControls: View {
    @State private var ledOn: Bool = false
    
    private let requestHandler = FBRequestHandler()
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                FBControl(title: "Quick Dispense", systemImageName: "fork.knife") {
                    requestHandler.quickDispense { success in
                        if success {
                            print("Succces!")
                        } else {
                            print("Failed!")
                        }
                    }
                }
                FBControl(title: (ledOn ? "Turn LED off" : "Turn LED on"),
                          systemImageName: (ledOn ? "light.beacon.min" : "light.beacon.max.fill")) {
                    if ledOn {
                        requestHandler.turnOffLED { success in
                            success ? print("yaya") : print("oops")
                        }
                    } else {
                        requestHandler.turnOnLED { success in
                            success ? print("yaya") : print("oops")
                        }
                    }
                    self.ledOn.toggle()
                }
            }
        }
    }
}
