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
    var centerLatitude : Double = 39.7892
    var centerLongitude : Double = 39.5925
    
    
    var body: some View {
        NavigationStack {
            GeometryReader {geometry in
                ScrollView {
                    VStack{
    //                    Header
                        SquareSub(geometry: geometry, mag: mag, date: date)
                        
                        NavigationLink(destination: MapView(latitude: centerLatitude,longitude: centerLongitude)){
                            Text("Haritadaki Konumu")
                        }.padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
                        
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
            DetailCard(titleText: "Derinlik", value: String(centerLatitude),extraValue: String(centerLongitude))
            
        }.padding(.horizontal,30)
    }
}
