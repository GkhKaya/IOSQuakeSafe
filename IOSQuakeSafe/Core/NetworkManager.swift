//
//  NetworkManager.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 24.01.2024.
//

import Foundation

final class NetworkManager{
    static func fetchLiveQuake() async throws -> QuakeModel{
        let urlString = "https://api.orhanaydogdu.com.tr/deprem/kandilli/live"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidUrl
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(QuakeModel.self, from: data)
        }catch (let error){
            print("Error is \(error)")
            throw ErrorCases.invalidData
        }
        
        
    }
}
