//
//  DetailView.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 29.01.2024.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @ObservedObject var vm = DetailViewViewModel()
    var title : String = "GOLYAKA-ILGIN (KONYA)"
    var date : String = "2024.01.29 14:31:13"
    var mag : Double = 2.4
    var depth : Double = 5.6
    var center: String = "Konya"
    var centerCityCode: Int = 42
    var centerLatitude : Double = 28.9388
    var centerLongitude : Double = 40.4382
    
    
    var body: some View {
        NavigationStack {
            GeometryReader {geometry in
                ScrollView {
                    VStack{
    //                    Header
                        Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude), latitudinalMeters: 100000, longitudinalMeters: 100000))){
                            Annotation("Merkez Nokta", coordinate: CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)) {
                                ZStack {
                                    Circle().frame(width: 30,height: 30)
                                        .foregroundStyle(.blue.opacity(0.5))
                                                         
                                    Circle().frame(width: 20,height: 20).foregroundStyle(.white.opacity(0.6))
                                        
                                    Circle().frame(width: 10,height: 10)
                                        .foregroundStyle(.blue.opacity(0.8))
                                }
                            }
                                
                        }.clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normalRadius))
                        .padding(.vertical,ProjectPaddings.Bottom.large.rawValue)
                        .padding(.horizontal,10)
                        .frame(width: geometry.dw(width: 1),height: geometry.dh(height: 0.4))
                        .mapControls {
                            MapCompass()
                            MapPitchToggle()
                            MapUserLocationButton()}
                        
                        
                        
                        
                        DetailQuakeTitle(title: title)
                       
//
                        DetailDetailsSub(center: center, centerCityCode: centerCityCode, mag: mag, depth: depth,centerLatitude: centerLatitude,centerLongitude: centerLongitude)
                        
                        
                    }.navigationTitle(LocalKeys.DetailView.details.rawValue.locale()).navigationBarTitleDisplayMode(.inline).multilineTextAlignment(.center)
                }
            }
        }
        
    }
}


#Preview {
    DetailView()
}

struct SquareSub: View {
    var geometry : GeometryProxy
    var mag : Double
    var date : String
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Rectangle()
                    .stroke(Color.lead, lineWidth: 14)
                    .frame(width: geometry.dw(width: 0.6), height: geometry.dh(height: 0.3))
                
                VStack {
                    
                    
                    Text(String(format: "%.1f", mag))
                        .modifier(ExtraLargeTitle())
                        .padding(.bottom,ProjectPaddings.Bottom.extraSmall.rawValue)
                    
                    Text("\(date)")
                        .modifier(MediumNormalTitle())
                    
                }
                
            }
            Spacer()
        }.padding(.vertical,ProjectPaddings.Vertical.large.rawValue)
    }
}

struct DetailQuakeTitle: View {
    var title : String
    var body: some View {
        Text("\(title)")
            .lineLimit(5)
            .multilineTextAlignment(.center)
            .modifier(BoldMediumTitle())
            .padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
    }
}

struct DetailDetailsSub: View {
    var center: String
    var centerCityCode : Int
    var mag : Double
    var depth: Double
    var centerLatitude : Double
    var centerLongitude : Double
    var body: some View {
        VStack {
            DetailCard(titleText: "Merkez",value: center)
            DetailCard(titleText: "Merkez Şehir Plaka kodu",value: String(centerCityCode))
            DetailCard(titleText: "Büyüklük",value: String(mag))
            DetailCard(titleText: "Derinlik", value: String(depth))
            DetailCard(titleText: "Koordinatları", value: String(centerLatitude),extraValue: String(centerLongitude))
            
        }.padding(.horizontal,30)
    }
}
