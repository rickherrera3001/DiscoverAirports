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
  
    @ObservedObject var airports = AirportViewModel()
    @State var searchText = ""
    
    
    var body: some View {
        
        List(airports.airports, id: \.id) { airport in
            VStack(alignment: .leading) {
                Text("Name: \(airport.name)")
                Text("IATA Code: \(String(describing: airport.iataCode))")
                Text("Country: \(airport.isoCountry)")
                Text("Continent: \(airport.continent)")
            }
        }
        
        .onAppear {
            airports.fetchAirports(country: searchText)
                
                }
            }
        }

#Preview {
    AirportListView()
}
