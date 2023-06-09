//
//  ProfileHost.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: TaskData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(TaskData())
    }
}
