//
//  HomeView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation
import SwiftUI
import MapKit
import UIKit

// Esta estructura representa la vista de búsqueda.
struct SearchView: View {
    // Estado para almacenar el texto de búsqueda.
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack {
                // Título de la vista de búsqueda.
                Text(" SEARCH AIRPORT")
                    .font(.system(size: 50))
                    .foregroundColor(.green)
                    .bold()
                
                // Campo de texto para ingresar el término de búsqueda.
                TextField("ingrese el pais", text: $searchText)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,5)
                
                NavigationLink(destination: TabBarView(query: searchText)) {
                    Text("Search")
                    
                    
                }
                .padding()
            }
            .padding()
        }
    }
    
}

// Esta estructura proporciona una vista previa de la vista de búsqueda.
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
