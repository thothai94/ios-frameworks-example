//
//  SettingsNavigationRow.swift
//  SettingsKit
//
//  Created by Võ Toàn on 21/04/2023.
//

import Foundation
import SwiftUI

public struct SettingsNavigationRow<Destination: View>: View {
    private var title: String
    private var image: String
    private var destination: Destination
    
    /// A generic settings row which can be customised according to your needs.
    /// - Parameters:
    ///   - title: The title of the row.
    ///   - image: The SF symbol for the row.
    ///   - destination: The view to navigate to, after tapping the row.
    public init(_ title: String, image: String, destination: Destination) {
        self.image = image
        self.title = title
        self.destination = destination
    }
    
    public var body: some View {
        NavigationLink(destination: destination) {
            SettingsRow(title, image: image, showDisclosure: true)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

public extension View {
    func settingsBackground(cornerRadius: CGFloat = 16,
                            innerPadding: CGFloat = 8,
                            outerPadding: CGFloat = 16) -> some View {
        self
            .padding(.horizontal, 16)
            .padding(.vertical, innerPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius,
                                         style: .continuous)
                .fill(Color(.secondarySystemBackground)))
            .padding(outerPadding)
    }
}
