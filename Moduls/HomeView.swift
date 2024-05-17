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


struct SearchView: View {

    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack {
               
                Text(" SEARCH AIRPORT")
                    .font(.system(size: 50))
                    .foregroundColor(.green)
                    .bold()
                
                TextField("ingrese el pais", text: $searchText)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,5)
                
                NavigationLink(destination: TabBarView(query: searchText)) {
                    Text("Search")
                        .foregroundColor(.white)
                                                .padding()
                                                .background(Color.green)
                                                .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
