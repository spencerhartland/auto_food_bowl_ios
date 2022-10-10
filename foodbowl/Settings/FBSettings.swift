//
//  FBSettings.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/9/22.
//

import SwiftUI

public struct FBSettings: View {
    @Binding var navigateToSettingsPage: Bool
    @Binding var navigateToChangePetName: Bool
    
    public var body: some View {
        List {
            Section {
                Button {
                    self.navigateToChangePetName.toggle()
                } label: {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 18))
                        Text("Change name")
                            .font(FBFonts.medium(size: 20))
                    }
                }
            } header: {
                Text("App Settings")
                    .font(FBFonts.semibold(size: 16))
            } footer: {
                Text("Change the name of the pet who uses this bowl. This determines the device's name (e.g. Fido's bowl).")
                    .font(FBFonts.regular(size: 12))
            }
            Section {
                Button {
                    print("Edit schedule")
                } label: {
                    HStack {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 18))
                        Text("Edit schedule")
                            .font(FBFonts.medium(size: 20))
                    }
                }
            } header: {
                Text("Device Settings")
                    .font(FBFonts.semibold(size: 16))
            }
        footer: {
           Text("Edit the automatic feeding schedule.")
               .font(FBFonts.regular(size: 12))
       }
            Section {
                Button {
                    self.navigateToSettingsPage.toggle()
                } label: {
                    Text("EXIT SETTINGS")
                        .font(FBFonts.medium(size: 20))
                }
            } footer: {
                Text("Your changes will be saved automatically.")
                    .font(FBFonts.regular(size: 12))
            }
        }
    }
}

public struct FBSettings_Previews: PreviewProvider {
    public static var previews: some View {
        return FBSettings(navigateToSettingsPage: .constant(true), navigateToChangePetName: .constant(false))
    }
}
