//
//  HomeView.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text(" SEARCH AIRPORT")
                .font(.system(size: 50))
                .foregroundColor(.green)
                .bold()

            TextField("Search", text: $searchText)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top,5)

            Button(action: {
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
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

