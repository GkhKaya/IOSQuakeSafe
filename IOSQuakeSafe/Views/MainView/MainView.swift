//
//  MainView.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 27.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainvViewVieModel()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    ForEach(viewModel.liveDatas?.result ?? [], id: \.id){data in
                        NavigationLink(destination:DetailView(
                            title: data.title ?? "",
                            mag: data.mag ?? 0.0,
                            depth: data.depth ?? 0.0,
                            center: data.locationProperties?.epiCenter?.name ?? "",
                            centerCityCode: data.locationProperties?.epiCenter?.cityCode ?? 00,
                            centerLatitude: data.geojson?.coordinates?[0] ?? 37.4567,
                            centerLongitude: data.geojson?.coordinates?[1] ?? 37.4567
                        )){
                            LiveListCards(mag: data.mag ?? 0.0, title: data.title ?? "", date: data.date ?? "").tint(colorScheme == .dark ? Color.white : Color.black)
                        }
                    }
                }.padding(.all,ProjectPaddings.All.normal.rawValue)
                .navigationTitle(LocalKeys.MainvView.mainViewTitle.rawValue.locale()).navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Image(systemName: "line.3.horizontal")
                    }
                    
            }
        }.task {
            await viewModel.getLiveData()
        }
    }
}


#Preview {
    MainView()
}
