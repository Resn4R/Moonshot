//
//  MissionCrewView.swift
//  Moonshot
//
//  Created by Vito Borghi on 12/09/2023.
//

import SwiftUI

struct MissionCrewView: View {    

    let crew: [CrewMember]
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    init(crew: [CrewMember]) {
        self.crew = crew
    }
}

struct MissionCrewView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static let crew = missions[0].crew.map { member in
        if let astronaut = astronauts[member.name]{
            return CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    static var previews: some View {
        MissionCrewView(crew: crew)
            .background(.darkBackground)
    }
}
