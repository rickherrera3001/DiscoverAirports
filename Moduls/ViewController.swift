//
//  viewController.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 15/05/24.
//

import Foundation
import SwiftUI
import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView = MKMapView()
    var airports: [Airports] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        
    }
        func setupMapView(){
            mapView.frame = view.bounds
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(mapView)
        }
    }

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        
    }
}
