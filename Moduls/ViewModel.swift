////
////  ViewModel.swift
////  DiscoverAirports
////
////  Created by Ricardo Developer on 13/05/24.
////

import Foundation
import MapKit
import SwiftUI

class AirportViewModel: ObservableObject {
    @Published var airports: [Airport] = []
    @Published var error: Error?
    private let apiClient = APIClient()
    
    func fetchAirports(country: String) {
        apiClient.fetchData(country: country) { result in
            DispatchQueue.main.async{
                switch result {
                case .success(let airports):
                    self.airports = airports
                case .failure(let error):
                    print("Error fetching airports: \(error)")
                }
            }
        }
    }
}
