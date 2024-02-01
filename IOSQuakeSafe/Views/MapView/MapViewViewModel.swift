//
//  MapViewViewModel.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 31.01.2024.
//

import Foundation
import MapKit
import _MapKit_SwiftUI
import SwiftUI
final class MapViewViewModel : ObservableObject{
   

    func setMapPosition(latitude:Double,longitude:Double) -> MapCameraPosition{
        let cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),latitudinalMeters: 1000,longitudinalMeters: 1000))
        
       return cameraPosition
        
    }
}
