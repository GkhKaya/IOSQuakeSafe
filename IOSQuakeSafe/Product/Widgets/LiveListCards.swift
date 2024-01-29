//
//  LiveListCards.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 27.01.2024.
//

import SwiftUI
import Foundation

struct LiveListCards: View {
    var mag : Double
    var title : String

    var date : String
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text(String(format: "%.1f", mag))
                        .modifier(BoldLargeTitle())
                        .foregroundStyle(Color.redPegasus)
                Spacer()
                Text(title).modifier(BoldNormalTitle())
                    .multilineTextAlignment(.center)
                Spacer()
                Image(systemName: "chevron.right")
                Spacer()
            }.padding(.all,ProjectPaddings.All.normal.rawValue)
                
            Text("Gün        Saat")
            Text("\(date)")
                .padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
        }
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normalRadius))
            .padding(.all,ProjectPaddings.All.normal.rawValue)
            .controlSize(.large)
            
    }
}

#Preview {
    LiveListCards(mag: 3.1, title: "safgafsgasfgasfg", date: "2222222")
}
