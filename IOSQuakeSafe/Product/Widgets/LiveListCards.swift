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
        VStack(alignment: .leading){
            HStack{
                MagSub(mag: mag)
                TitleAndDateSub(title: title, date: date)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding()
            CustomDivider()
        }.padding(.bottom,ProjectPaddings.Bottom.large.rawValue)
            
    }
}

#Preview {
    LiveListCards(mag: 3.1, title: "TEPEBASI-ELBISTAN (KAHRAMANMARAS)", date: "2024.01.29 13:51:10")
}

struct MagSub: View {
    var mag: Double
    var body: some View {
        Text(String(format: "%.1f",mag))
            .modifier(MediumMediumTitle())
            .foregroundStyle(.redPegasus)
            .background(Circle().stroke(Color.lead,lineWidth: 30))
            .padding(.trailing,ProjectPaddings.Trailing.large.rawValue)
    }
}

struct TitleAndDateSub: View {
    var title : String
    var date : String
    var body: some View {
        VStack{
            Text("\(title)")
                .modifier(BoldNormalTitle())
                .padding(.bottom,ProjectPaddings.Bottom.extraSmall.rawValue)
                .multilineTextAlignment(.center)
            
            Text("\(date)")
                .modifier(MediumNormalTitle())
                .foregroundStyle(Color.old_silver)
        }
    }
}

struct CustomDivider: View {
    var body: some View {
        Divider().frame(maxWidth: .infinity).overlay(Color.old_silver)
    }
}
