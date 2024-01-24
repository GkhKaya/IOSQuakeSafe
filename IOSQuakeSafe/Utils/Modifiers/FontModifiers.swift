//
//  FontModifiers.swift
//  IOSQuakeSafe
//
//  Created by Gokhan Kaya on 24.01.2024.
//

import Foundation
import SwiftUI


struct ExtraLargeTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.extraLarge))
    }
}

struct LargeTitleModifier : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.large))
    }
}

struct ButtonTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.normal))
    }
}


struct BoldLargeTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.large))
    }
}

struct BoldNormalTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.normal))
    }
}

struct BoldMediumTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.medium))
    }
}



struct MediumLargeTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Regular", size: FontSizes.large))
    }
}

struct MediumMediumTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Regular", size: FontSizes.medium))
    }
}

struct MediumNormalTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Regular", size: FontSizes.normal))
    }
}
    
struct MediumSmallTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Regular", size: FontSizes.small))
    }
}

    
