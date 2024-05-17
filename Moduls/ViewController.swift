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
    var airportMarkers: [Airport]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
        
        let region = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: 19.64031, longitude: -99.09754), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06))
        mapView.setRegion(region, animated: true)
        addMarkers()
    }
    
    func addMarkers() {
        guard let airportPoints = airportMarkers else {
            return
        }
        for item in airportPoints {
            guard let latitude = Double(item.latitudeDege), let longitude = Double(item.longitudeDeg) else {
                continue
            }
            
            let annotation1 = MKPointAnnotation()
            annotation1.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation1.title = item.name
            
            mapView.addAnnotation(annotation1)
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    var accesvm : AirportViewModel
    var mapViewBridge = MapViewController()
    
    func makeUIViewController(context: Context) -> MapViewController {
        mapViewBridge.airportMarkers = accesvm.airports
        return mapViewBridge
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        uiViewController.airportMarkers = accesvm.airports
        uiViewController.addMarkers()
    }
}

typealias UIViewControllerType = MapViewController
