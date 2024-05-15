//
//  HomeView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation
import SwiftUI


// Esta estructura representa la vista de búsqueda.
struct SearchView: View {
    // Estado para almacenar el texto de búsqueda.
    @State private var searchText = ""
    @State private var navigationToMapView = false //Estado para controlar la navegacion del MapView
    
    
    var body: some View {
        NavigationView{
            VStack {
                // Título de la vista de búsqueda.
                Text(" SEARCH AIRPORT")
                    .font(.system(size: 50))
                    .foregroundColor(.green)
                    .bold()
                
                // Campo de texto para ingresar el término de búsqueda.
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,5)
                
                // Botón para realizar la búsqueda.
                Button(action: {
                    
                    navigationToMapView = true
                    // Aquí puedes implementar la lógica de búsqueda
                    // Por ejemplo, puedes mostrar los resultados en otro view o realizar una acción específica al hacer clic en el botón
                    print("Searching for: \(searchText)")
                }) {
                    Text("Search")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                // NavigationLink para ir a MapView
                NavigationLink(destination: tabBarView(), isActive: $navigationToMapView) {
                    EmptyView()//Esto es necesario para activar la navegacion
                    //Text("GO TO MAP")
                    
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
    
    // Esta estructura proporciona una vista previa de la vista de búsqueda.
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
    
}
