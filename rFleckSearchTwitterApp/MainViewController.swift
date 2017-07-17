//
//  MainViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/16/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var Teams: UITableView!
    let detailSegueID: String = "DetailView"
    var teamSelected: String = ""
    var listOfTeams: [Team] = [ Team(teamCity: "Atlanta",teamName: "Hawks", teamLogo: "Path"),
                                Team(teamCity: "Miami",teamName: "Heat", teamLogo: "Path"),
                                Team(teamCity: "Cleveland",teamName: "Cavaliers", teamLogo: "Path"),
                                Team(teamCity: "Toronto",teamName: "Raptors", teamLogo: "Path"),
                                Team(teamCity: "Chicago",teamName: "Bulls", teamLogo: "Path"),
                                Team(teamCity: "Boston",teamName: "Celtics", teamLogo: "Path"),
                                Team(teamCity: "Indiana",teamName: "Pacers", teamLogo: "Path"),
                                Team(teamCity: "New York",teamName: "Knicks", teamLogo: "Path"),
                                Team(teamCity: "Philadelphia",teamName: "76ers", teamLogo: "Path"),
                                Team(teamCity: "Brooklyn",teamName: "Nets", teamLogo: "Path"),
                                Team(teamCity: "Washington",teamName: "Wizards", teamLogo: "Path"),
                                Team(teamCity: "Detroit",teamName: "Pistons", teamLogo: "Path"),
                                Team(teamCity: "Orlando",teamName: "Magic", teamLogo: "Path"),
                                Team(teamCity: "Milwaukee",teamName: "Bucks", teamLogo: "Path"),
                                Team(teamCity: "Charlotte",teamName: "Hornets", teamLogo: "Path"),
                                Team(teamCity: "San Antonio",teamName: "Spurs", teamLogo: "Path"),
                                Team(teamCity: "Golden State",teamName: "Warriors", teamLogo: "Path"),
                                Team(teamCity: "Houston",teamName: "Rockets", teamLogo: "Path"),
                                Team(teamCity: "Oklahoma City",teamName: "Thunder", teamLogo: "Path"),
                                Team(teamCity: "Los Angeles",teamName: "Lakers", teamLogo: "Path"),
                                Team(teamCity: "Los Angeles",teamName: "Clippers", teamLogo: "Path"),
                                Team(teamCity: "Portland Trail",teamName: "Blazers", teamLogo: "Path"),
                                Team(teamCity: "Dallas",teamName: "Mavericks", teamLogo: "Path"),
                                Team(teamCity: "Memphis",teamName: "Grizzles", teamLogo: "Path"),
                                Team(teamCity: "New Orleans",teamName: "Pelicans", teamLogo: "Path"),
                                Team(teamCity: "Utah",teamName: "Jazz", teamLogo: "Path"),
                                Team(teamCity: "Minnesota",teamName: "Timberwolves", teamLogo: "Path"),
                                Team(teamCity: "Phoenix",teamName: "Suns", teamLogo: "Path"),
                                Team(teamCity: "Sacramento",teamName: "Kings", teamLogo: "Path"),
                                Team(teamCity: "Denver",teamName: "Nuggets", teamLogo: "Path")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NBA Teams - Twitter News"
      
        self.listOfTeams = self.listOfTeams.sorted(by: { $0.TeamCity < $1.TeamCity })
        self.Teams.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.Teams.dataSource = self
        self.Teams.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let team: Team = listOfTeams[indexPath.row]
        
        cell.textLabel!.text = team.TeamCityName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team: Team = listOfTeams[indexPath.row]
        
        teamSelected = team.TeamCityName()
        self.performSegue(withIdentifier: detailSegueID, sender: self)
        //Alert.DisplayInfoOKButton("Your Selection", message: teamSelected, actionTitle: "OK", controller: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueID {
            let detailViewController = segue.destination
                as! DetailViewController
            
            detailViewController.teamForSearch = teamSelected
            detailViewController.navigationItem.title = teamSelected
        }
        
    }
}
