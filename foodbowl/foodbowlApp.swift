//
//  foodbowlApp.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/7/22.
//

import SwiftUI

@main
struct foodbowlApp: App {
    @AppStorage(FBConstants.petNameUserDefaultsKey) var petName: String = ""
    
    @State private var navigateToControlView: Bool = false
    @State private var navigateToChangePetName: Bool = false
    @State private var navigateToSettingsPage: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if navigateToChangePetName{
                ChangePetName(navigateToChangePetName: $navigateToChangePetName)
                    .preferredColorScheme(.light)
            } else if navigateToSettingsPage {
                FBSettings(navigateToSettingsPage: $navigateToSettingsPage, navigateToChangePetName: $navigateToChangePetName)
            } else if navigateToControlView {
                ControlView(navigateToSettingsPage: $navigateToSettingsPage)
                    .preferredColorScheme(.light)
            } else {
                Onboarding(navigateToControlView: $navigateToControlView)
                    .preferredColorScheme(.light)
            }
        }
    }
}
