//
//  Model.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

// MARK: - Airport
struct Airport: Codable {
    // Longitud geográfica del aeropuerto en grados.
    let longitudeDeg: String
    // Otro nombre del aeropuerto (opcional).
    let otherName: String?
    // Código IATA del aeropuerto.
    let iataCode, elevationFt: String
    // Disponibilidad del aeropuerto.
    let isAvailable: Bool
    // Código local del aeropuerto (opcional).
    let localCode: String?
    // ID del aeropuerto.
    let id: Int
    // Continente en el que se encuentra el aeropuerto.
    let continent: String
    // ID del país al que pertenece el aeropuerto.
    let countryID: Int
    // Identificador del aeropuerto.
    let ident: String
    // Enlace a la página de inicio del aeropuerto.
    let homeLink: String
    // Código ISO del país al que pertenece el aeropuerto.
    let isoCountry, typeA: String
    // Enlace a la página de Wikipedia del aeropuerto.
    let wikipediaLink: String
    // Región ISO en la que se encuentra el aeropuerto.
    let isoRegion, name, keywords, municipality: String
    // Latitud geográfica del aeropuerto en grados.
    let latitudeDege: String
    // Código del aeropuerto (opcional).
    let code: String?
    // Servicio programado en el aeropuerto.
    let scheduledService, gpsCode: String

    // Enumeración para mapear las claves de codificación.
    enum CodingKeys: String, CodingKey {
        case longitudeDeg = "longitude_deg"
        case otherName = "other_name"
        case iataCode = "iata_code"
        case elevationFt = "elevation_ft"
        case isAvailable = "is_available"
        case localCode = "local_code"
        case id, continent
        case countryID = "country_id"
        case ident
        case homeLink = "home_link"
        case isoCountry = "iso_country"
        case typeA
        case wikipediaLink = "wikipedia_link"
        case isoRegion = "iso_region"
        case name, keywords, municipality
        case latitudeDege = "latitude_dege"
        case code
        case scheduledService = "scheduled_service"
        case gpsCode = "gps_code"
    }
}

// Alias para una lista de aeropuertos.
typealias Airports = [Airport]

