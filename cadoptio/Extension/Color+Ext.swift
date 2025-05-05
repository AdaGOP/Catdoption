//
//  Color+Ext.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

extension Color {
    
    static var adaptiveSystemBackground: Color {
        // MARK: - TO DO
#if os(iOS)
        return Color(.systemBackground)
#elseif os(macOS)
        return Color(NSColor.windowBackgroundColor)
#elseif os(watchOS)
        return Color.black
#endif
    }
    
    static var adaptiveSystemGray6: Color {
        // MARK: - TO DO
#if os(iOS)
        return Color(.systemGray6)
#elseif os(macOS)
        return Color(NSColor.controlBackgroundColor) // approximate match
#elseif os(watchOS)
        return Color(white: 0.95)
#endif
    }
}
