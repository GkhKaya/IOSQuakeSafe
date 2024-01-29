//
//  MainView.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 27.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainvViewVieModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    ForEach(viewModel.liveDatas?.result ?? [], id: \.id){data in
                        LiveListCards(mag: data.mag ?? 0.0, title: data.title ?? "", date: data.date ?? "")
                    }
                }.navigationTitle(LocalKeys.MainvView.mainViewTitle.rawValue.locale()).navigationBarTitleDisplayMode(.inline)
            }
        }.task {
            await viewModel.getLiveData()
        }
    }
}


#Preview {
    MainView()
}
