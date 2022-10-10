//
//  Onboarding.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/7/22.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage(FBConstants.petNameUserDefaultsKey) var petName: String = ""
    
    @State private var enteredText: String = ""
    @State private var validPetName: Bool = false
    @Binding var navigateToControlView: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Spacer()
                VStack(alignment: .leading, spacing: -16) {
                    Text("Hello")
                        .font(.custom("Rajdhani-Bold", size: 80))
                    Text("Who is this food bowl for?")
                        .font(.custom("Rajdhani-SemiBold", size: 24))
                }
                VStack(alignment: .leading) {
                    TextField(text: $enteredText) {
                        Text("Enter your pet's name")
                    }
                    .customTextFieldStyle()
                    .onChange(of: enteredText) { _ in
                        if enteredText != "" {
                            validPetName = true
                        } else {
                            validPetName = false
                        }
                    }
                    Text("This determines the name of your pet's foodbowl (e.g. Fido's foodbowl).")
                        .font(FBFonts.footer)
                        .foregroundColor(FBColors.footerText)
                }
                Spacer()
                FBLargeButton(title: "GET STARTED", image: "arrow.right") {
                    UserDefaults.standard.set(enteredText, forKey: FBConstants.petNameUserDefaultsKey)
                    self.navigateToControlView.toggle()
                }
                .isActive($validPetName)
            }
            .padding()
        }
        .safeAreaInset(edge: .top) {
            FBLogo(size: 32)
                .padding(.top, 48)
        }
        .background {
            Color.white
                .ignoresSafeArea()
        }
        .onAppear {
            if petName != "" {
                self.navigateToControlView = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(navigateToControlView: .constant(false))
    }
}
