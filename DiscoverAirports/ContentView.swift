//
//  ContentView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal)
                
                Button(action: {
                    // Acción que se ejecutará al presionar el botón de búsqueda
                    print("Search button tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
            
            // Aquí puedes agregar el resto de tu contenido
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
