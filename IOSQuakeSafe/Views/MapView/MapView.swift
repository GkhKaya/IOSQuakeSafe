//
//  MapView.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 30.01.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var vm = MapViewViewModel()
    var latitude : Double = 37.3697
    var longitude : Double = 38.4565
    var body: some View {
        Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 100000, longitudinalMeters: 100000))){
            Annotation("Merkez Nokta", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) {
                ZStack {
                    Circle().frame(width: 30,height: 30)
                        .foregroundStyle(.blue.opacity(0.5))
                                         
                    Circle().frame(width: 20,height: 20).foregroundStyle(.white.opacity(0.6))
                        
                    Circle().frame(width: 10,height: 10)
                        .foregroundStyle(.blue.opacity(0.8))
                }
            }
                
        }.mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
            
        }
        
    }
}





#Preview {
    MapView()
}


