//
//  Setting-ChangePetName.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

struct ChangePetName: View {
    @State var enteredText: String = ""
    @State var validPetName: Bool = false
    
    @Binding var navigateToChangePetName: Bool
    
    var body: some View {
        VStack {
            Text("Who is this food bowl for?")
                .font(.custom("Rajdhani-SemiBold", size: 24))
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
            FBLargeButton(title: "CHANGE NAME") {
                UserDefaults.standard.set(enteredText, forKey: FBConstants.petNameUserDefaultsKey)
                self.navigateToChangePetName.toggle()
            }
            .isActive($validPetName)
        }
        .padding()
    }
}

struct ChangePetName_Previews: PreviewProvider {
    static var previews: some View {
        ChangePetName(navigateToChangePetName: .constant(true))
    }
}
