//
//  SettingsView.swift
//  HelloDemoApp
//
//  Created by Võ Toàn on 21/04/2023.
//

import Foundation
import SwiftUI
import SettingsKit
import HelloLoggingFramework

struct SettingsView: View {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        ScrollView {
            VStack {
                SettingsNavigationRow("Account", image: "person.crop.circle", destination: SettingDetailView(title: "Accounts Screen"))
                
                SettingsNavigationRow("Phone Numbers", image: "number.circle",
                                      destination: SettingDetailView(title: "Phone Screen"))
                
                SettingsNavigationRow("Notifications", image: "bell.circle",
                                      destination: SettingDetailView(title: "Notifications Screen"))
            }
            .settingsBackground()
            
            VStack {
                SettingsRow("App Version \(appVersion)", image: "doc.append")
            }
            .settingsBackground()
        }
        .navigationTitle("Settings")
    }
}

struct SettingDetailView: View {
    let logger = HelloLogger()
    var title: String

    var body: some View {
        VStack (spacing: 24) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Text(title)

            Button {
                logger.helloWithText(text: title)
            } label: {
                Label("Print", systemImage: "applelogo")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12).fill(Color.cyan)
                    )
            }
        }
        .padding()
    }
}
