//
//  MainViewViewModel.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 27.01.2024.
//

import Foundation
final class MainvViewVieModel : ObservableObject{
    @Published var liveDatas: QuakeModel?
    @Published var goToWhistleView: Bool = false
    
    
    
    func getLiveData() async{
        do{
            let liveDatas = try await NetworkManager.fetchLiveQuake()
            self.liveDatas = liveDatas
        }catch(let error){
            print(error.localizedDescription)
        }
    }
}

