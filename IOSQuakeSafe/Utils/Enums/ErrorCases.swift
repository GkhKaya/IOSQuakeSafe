//
//  ErrorCases.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 27.01.2024.
//

import Foundation

enum ErrorCases: String, LocalizedError{
    case invalidUrl
    case invalidResponse
    case invalidData
    
    var errorDescription: String?{
        switch self{
        case .invalidUrl:
            return "Invalid URL found"
        case .invalidResponse:
            return "Invalid response found"
        case.invalidData:
            return "Invalid data found"
            
        }
    }
}
