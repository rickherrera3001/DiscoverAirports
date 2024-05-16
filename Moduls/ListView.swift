//
//  listView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 14/05/24.
//

import SwiftUI
import Foundation
import MapKit
import UIKit

struct AirportListView: View {
    // Variable de estado para almacenar los datos de los aeropuertos
    @ObservedObject var airports = AirportViewModel()
    @State var searchText = ""
    
    
    var body: some View {
        // Lista para mostrar los aeropuertos
        List(airports.airports, id: \.id) { airport in
            VStack(alignment: .leading) {
                Text("Name: \(airport.name)")
                Text("IATA Code: \(String(describing: airport.iataCode))")
                Text("Country: \(airport.isoCountry)")
                Text("Continent: \(airport.continent)")
            }
        }
        // Llama al método fetchData() del cliente API cuando la vista se carga
        .onAppear {
            airports.fetchAirports(country: searchText)
                
                }
            }
        }


#Preview {
    AirportListView()
}


