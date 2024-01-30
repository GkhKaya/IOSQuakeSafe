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
    var centerLatitude : Double = 31.8327
    var centerLongitude : Double = 38.4898
    
    
    var body: some View {
        NavigationStack {
            GeometryReader {geometry in
                ScrollView {
                    VStack{
    //                    Header
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
                        
                        NavigationLink(destination: MainView()){
                            Text("Haritadaki Konumu")
                        }.padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
                        
                        Text("\(title)")
                            .lineLimit(5)
                            .multilineTextAlignment(.center)
                            .modifier(BoldMediumTitle())
                            .padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
                       
//
                        VStack {
                            DetailCard(titleText: "Merkez",value: center)
                            DetailCard(titleText: "Merkez Şehir Plaka kodu",value: String(centerCityCode))
                            DetailCard(titleText: "Büyüklük",value: String(mag))
                            DetailCard(titleText: "Derinlik", value: String(depth))
                            
                        }.padding(.horizontal,30)
                        
                        
                    }.navigationTitle(LocalKeys.DetailView.details.rawValue.locale()).navigationBarTitleDisplayMode(.inline).multilineTextAlignment(.center)
                }
            }
        }
        
    }
}


//extension CLLocationCoordinate2D{
//    static var centerLocation : CLLocationCoordinate2D{
//        return .init(latitude: , longitude: <#T##CLLocationDegrees#>)
//    }
//}


#Preview {
    DetailView()
}
