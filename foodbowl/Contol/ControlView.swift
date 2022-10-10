//
//  ControlView.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import SwiftUI

struct ControlView: View {
    @AppStorage(FBConstants.petNameUserDefaultsKey) var petName: String = ""
    
    @State var connectionStatus: Status = .checking
    @State var connected: Bool = false
    @State var listContentOffset: CGFloat = 0.0
    
    @Binding var navigateToSettingsPage: Bool
    
    private let requestHandler = FBRequestHandler()
    
    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Button {
                        self.navigateToSettingsPage.toggle()
                    } label: {
                        FBLogo(size: 20)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 32)
                    Text("\(petName)'s bowl")
                        .font(FBFonts.title)
                    FBConnectionStatus(status: $connectionStatus)
                        .padding(.bottom, 48)
                    if connectionStatus == .offline {
                        HStack {
                            VStack {
                                Spacer()
                                Image(systemName: "wifi.slash")
                                    .foregroundColor(.black)
                                    .font(.system(size: 96))
                                Text("No Connection")
                                    .foregroundColor(.black)
                                    .font(FBFonts.title)
                                Text("Couldn't connect to foodbowl.local on this network. " +
                                     "Check that the server is running and you're on the same network.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .font(FBFonts.footer)
                                Spacer()
                                FBLargeButton(title: "CHECK NOW") {
                                    checkConnection()
                                }
                            }
                        }
                    } else {
                        VStack {
                            FBStatusReport(previousMealTime: Date(timeIntervalSinceNow: -5760), nextMealTime: Date(timeIntervalSinceNow: 5040), foodStorage: 0.6)
                                .padding(.bottom, 32)
                            HStack {
                                Image(systemName: "dial.medium.fill")
                                    .font(.system(size: 28))
                                    .offset(y: -2)
                                Text("Controls")
                                    .font(FBFonts.semibold(size: 24))
                                Spacer()
                            }
                            FBQuickControls()
                            FBDispenseControl()
                            FBLEDColorPicker()
                        }
                        .isActive($connected)
                    }
                }
                Spacer()
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
            Spacer()
        }
        .onAppear {
            checkConnection()
        }
        .onChange(of: connectionStatus) { status in
            switch status {
            case .connected:
                self.connected = true
            default:
                self.connected = false
            }
        }
    }
    
    private func checkConnection() {
        connectionStatus = .checking
        requestHandler.testConnection { success in
            if success {
                connectionStatus = .connected
            } else {
                connectionStatus = .offline
            }
        }
    }
    
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(navigateToSettingsPage: .constant(false))
    }
}
