//
//  DynamicSizeGeometry.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 24.01.2024.
//

import Foundation

import SwiftUI
extension GeometryProxy {
    /// Dynamic hight by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dh(height : Double)  -> Double {
        return size.height * height
    }
    
    /// Dynamic width by device
    /// - Parameter width: Percent value
    /// - Returns: Calculated value for device width
    func dw(width : Double)  -> Double {
        return size.width * width
    }
}
