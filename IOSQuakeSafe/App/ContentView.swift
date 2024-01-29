//
//  ContentView.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = MainvViewVieModel()
    var body: some View {
        VStack {
            List(vm.liveDatas?.result ?? [], id: \.id){data in
                Text(data.title ?? "")
            }.task {
                await vm.getLiveData()
            }
        }
        
        .padding()
        }
    }


#Preview {
    ContentView()
}
