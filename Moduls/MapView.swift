//
//  MapView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 14/05/24.
//

import SwiftUI
import MapKit

// Esta estructura representa una vista de mapa en SwiftUI.
struct MapView: UIViewRepresentable {
    
    // Esta función se llama para crear la vista de mapa.
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // Esta función se llama cuando la vista de mapa necesita actualizarse.
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

// Esta estructura representa la vista de la barra de pestañas.
struct tabBarView: View {
    var body: some View{
        // TabView permite la navegación entre vistas usando pestañas.
        TabView{
            // Vista del mapa.
            mapContentView()
                .tabItem {
                    // Ícono y texto para la pestaña del mapa.
                    Image(systemName: "mappin")
                    Text("mapa")
                }
            // Vista de lista.
            AirportListView()
                .tabItem {
                    // Ícono y texto para la pestaña de la lista.
                    Image(systemName: "square.fill")
                    Text("Lista")
                }
        }
    }
}

// Esta estructura representa el contenido del mapa.
struct mapContentView: View {
    var body: some View {
        // Se muestra la vista del mapa.
        MapView()
            .onAppear()
    }
}

// Esta estructura proporciona una vista previa del contenido.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}

#Preview {
    mapContentView()
}

