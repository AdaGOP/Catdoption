//
//  Color+Ext.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

extension Color {
    
    static var adaptiveSystemBackground: Color {
#if os(iOS)
        return Color(.systemBackground)
#elseif os(macOS)
        return Color(NSColor.windowBackgroundColor)
#endif
    }
    
    static var adaptiveSystemGray6: Color {
#if os(iOS)
        return Color(.systemGray6)
#elseif os(macOS)
        return Color(NSColor.controlBackgroundColor) // approximate match
#endif
    }
}
