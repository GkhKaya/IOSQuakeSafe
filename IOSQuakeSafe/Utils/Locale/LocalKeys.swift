//
//  LocalKeys.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 24.01.2024.
//

import Foundation
import SwiftUI
struct LocalKeys {
    enum MainvView : String{
        case mainViewTitle = "mainViewTitle"
    }
    enum DetailView : String{
        case mag = "mag"
        case depth = "depth"
        case details = "details"
    }
}


extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
