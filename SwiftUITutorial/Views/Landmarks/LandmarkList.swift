//
//  LandmarkList.swift
//  SwiftUITutorial
//
//  Created by Дмитрий Мартьянов on 02.05.2024.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    // Обертка @State делает из переменной наблюдаемый объект, при изменении которого перестраивается та часть View, где переменная задействована
    // К переменной с модификатором @State имеет доступ только связанная с ней View
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            (!showFavoritesOnly || $0.isFavorite)
        }
    }
    
    var body: some View {
        // List работает только объектами, которые имеют уникальные поля
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
