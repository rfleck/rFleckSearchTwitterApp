//
//  Teams.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/24/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import Foundation

class Team {
    var TeamCity: String
    var TeamName: String
    var TeamLogo: String
    
    init(teamCity: String, teamName: String, teamLogo: String) {
        self.TeamCity = teamCity
        self.TeamName = teamName
        self.TeamLogo = teamLogo
    }
    
    func TeamCityName() -> String {
        return self.TeamCity + " " + self.TeamName
    }
}
