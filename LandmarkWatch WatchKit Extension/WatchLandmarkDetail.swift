//
//  WatchLandmarkDetail.swift
//  LandmarkWatch WatchKit Extension
//
//  Created by Дмитрий Мартьянов on 06.06.2024.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex {
            $0.id == landmark.id
        }!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            WatchLandmarkDetail(landmark: modelData.landmarks[0]).environmentObject(modelData)
                .previewDevice("Apple Watch Series 7 - 44mm")
            WatchLandmarkDetail(landmark: modelData.landmarks[0]).environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
