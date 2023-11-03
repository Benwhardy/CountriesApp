//
//  MapView.swift
//  Countries
//
//  Created by Ben Hardy on 11/3/23.
//

import SwiftUI

import MapKit

struct MapView: UIViewRepresentable {
    var country: Country

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let latitude = country.latlng?.first ?? 0
        let longitude = country.latlng?.last ?? 0

        let coordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}
