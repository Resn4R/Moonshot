//
//  MissionView.swift
//  Moonshot
//
//  Created by Vito Borghi on 11/09/2023.
//

import SwiftUI

struct MissionView: View {
    
    let crew: [CrewMember]
    
    let mission: Mission

    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.4)
                        .padding()
                    Text(mission.formattedLaunchDate)
                    
                    VStack(alignment: .leading) {
                        
                        CustomDivider()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    CustomDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)                    
                }
                    
                MissionCrewView(crew: crew)
                    .padding()
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[3], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
