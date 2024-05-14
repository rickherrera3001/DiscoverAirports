//
//  Model.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

struct Airport: Decodable {
    let name: String
    let latitude: Double
    let longitude: Double
}

struct AirportResponse: Decodable {
    let airports: [Airport]
}

