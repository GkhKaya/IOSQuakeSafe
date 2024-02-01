//
//  DetailCard.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 30.01.2024.
//

import SwiftUI
import Foundation

struct DetailCard: View {
    var titleText: String = "Depth"
    var desc : String?
    var value : String = "80KM"
    var extraValue: String?

    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack(alignment: .leading){
                    Text("\(titleText)").modifier(BoldNormalTitle())
                        .padding(.bottom,ProjectPaddings.Bottom.extraSmall.rawValue)
                        .multilineTextAlignment(.leading)
                    
                    if let unwrappedDesc = desc {
                        Text("\(unwrappedDesc)").modifier(MediumNormalTitle()).foregroundStyle(Color.old_silver)
                    }
                    
                }.padding(.horizontal,ProjectPaddings.Horizontal.large.rawValue)
                Spacer()
                VStack {
                    Text("\(value)")
                        .modifier(BoldMediumTitle())
                    .padding(.horizontal,ProjectPaddings.Horizontal.large.rawValue)
                    
                    if let unwrappedExtraValue = extraValue {
                        Text("\(unwrappedExtraValue)")
                            .modifier(BoldMediumTitle())
                        .padding(.horizontal,ProjectPaddings.Horizontal.large.rawValue)
                    }
                    
                }
            }.padding(.vertical,ProjectPaddings.Vertical.normal.rawValue)
        }.background(Color.lead)
        
    }
}

#Preview {
    DetailCard()
}
