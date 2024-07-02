//
//  RotatedBadgeSymbol.swift
//  SwiftUITutorial
//
//  Created by Дмитрий Мартьянов on 12.05.2024.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 0.0))
    }
}
