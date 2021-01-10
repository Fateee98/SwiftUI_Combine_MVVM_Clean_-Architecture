//
//  NavigationBarTitleConfiguration.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 10/01/2021.
//

import SwiftUI

public struct NavigationBarTitleConfiguration {
    public let title: String
    public let displayMode: NavigationBarItem.TitleDisplayMode

    public init(title: String, displayMode: NavigationBarItem.TitleDisplayMode) {
        self.title = title
        self.displayMode = displayMode
    }
}

extension NavigationBarItem.TitleDisplayMode {
    var uikitDisplayMode: UINavigationItem.LargeTitleDisplayMode {
        switch self {
        case .automatic: return .automatic
        case .inline: return .never
        case .large: return .always
        @unknown default: return .automatic
        }
    }
}
