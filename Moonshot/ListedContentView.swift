//
//  ListedContentView.swift
//  Moonshot
//
//  Created by Vito Borghi on 12/09/2023.
//

import SwiftUI

struct ListedContentView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 125, height: 100)
                                .padding(.vertical, 5)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .navigationTitle("Moonshot")
            .navigationBarBackButtonHidden(true)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        ContentView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .foregroundColor(.white)
                    }

                }
            }
        }
    }
}

struct ListedContentView_Previews: PreviewProvider {
   static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
   static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListedContentView(astronauts: astronauts, missions: missions)
    }
}
