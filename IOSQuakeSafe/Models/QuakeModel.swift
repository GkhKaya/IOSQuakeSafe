//
//  QuakeModel.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 24.01.2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quakeModel = try? JSONDecoder().decode(QuakeModel.self, from: jsonData)

import Foundation

// MARK: - QuakeModel
struct QuakeModel: Codable {
    let status: Bool?
    let httpStatus, serverloadms: Int?
    let desc: String?
    let metadata: Metadata?
    let result: [Result]?
}

// MARK: - Metadata
struct Metadata: Codable {
    let dateStarts, dateEnds: String?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case dateStarts = "date_starts"
        case dateEnds = "date_ends"
        case total
    }
}

// MARK: - Result
struct Result: Codable {
    let id, earthquakeID: String?
    let provider: Provider?
    let title, date: String?
    let mag, depth: Double?
    let geojson: Geojson?
    let locationProperties: LocationProperties?
    let rev: JSONNull?
    let dateTime: String?
    let createdAt: Int?
    let locationTz: LocationTz?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case earthquakeID = "earthquake_id"
        case provider, title, date, mag, depth, geojson
        case locationProperties = "location_properties"
        case rev
        case dateTime = "date_time"
        case createdAt = "created_at"
        case locationTz = "location_tz"
    }
}

// MARK: - Geojson
struct Geojson: Codable {
    let type: TypeEnum?
    let coordinates: [Double]?
}

enum TypeEnum: String, Codable {
    case point = "Point"
}

// MARK: - LocationProperties
struct LocationProperties: Codable {
    let closestCity, epiCenter: ClosestCity?
    let closestCities: [ClosestCity]?
    let airports: [Airport]?
}

// MARK: - Airport
struct Airport: Codable {
    let distance: Double?
    let name, code: String?
    let coordinates: Geojson?
}

// MARK: - ClosestCity
struct ClosestCity: Codable {
    let name: String?
    let cityCode: Int?
    let distance: Double?
    let population: Int?
}

enum LocationTz: String, Codable {
    case europeIstanbul = "Europe/Istanbul"
}

enum Provider: String, Codable {
    case kandilli = "kandilli"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
