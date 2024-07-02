//
//  ProfileHost.swift
//  SwiftUITutorial
//
//  Created by Дмитрий Мартьянов on 13.05.2024.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode: Binding<EditMode>?
    @EnvironmentObject var modelData: ModelData
    @State private var profile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        profile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $profile)
                    .onAppear {
                        profile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = profile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
