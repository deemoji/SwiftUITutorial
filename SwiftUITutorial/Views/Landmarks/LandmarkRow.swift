//
//  LandmarkRow.swift
//  SwiftUITutorial
//
//  Created by Дмитрий Мартьянов on 02.05.2024.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

struct LandmarkView_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landmarks
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.sizeThatFits)
    }
}
