//
//  ProfileSummary.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Text(profile.userName)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonPhoto.rawValue)")
                Text("Goal date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
