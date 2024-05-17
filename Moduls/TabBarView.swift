//
//  TabBarView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 14/05/24.
//

import SwiftUI
import MapKit

struct TabBarView: View {
    var query = ""
    
    var body: some View{
        
        TabView{
            // Vista del mapa.
            MapContentView(searchText: query)
                .tabItem {
                    // Ícono y texto para la pestaña del mapa.
                    Image(systemName: "mappin")
                    Text("mapa")
                }
            // Vista de lista.
            AirportListView(searchText: query)
                .tabItem {
                    // Ícono y texto para la pestaña de la lista.
                    Image(systemName: "square.fill")
                    Text("Lista")
            }
        }
    }
}

// Esta estructura representa el contenido del mapa.
struct MapContentView: View {
    @ObservedObject var AirportVM = AirportViewModel()
    @State var searchText = ""
    @State private var airportMarkers: [AirportMarker] = []
    
    var body: some View {
        
        MapViewControllerBridge(accesvm: AirportVM)
        
            .onAppear{
                AirportVM.fetchAirports(country: searchText)
        }
    }
}

struct AirportMarker: Identifiable {
    let id = UUID()
    let airport: Airport
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
}

struct tabBarList: View {
    var body: some View {
        tabBarList()
    }
}
