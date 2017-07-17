//
//  DetailViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/25/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

class DetailViewController: TWTRTimelineViewController {
    var teamForSearch: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let client: TWTRAPIClient = TWTRAPIClient()
        
        //self.dataSource = TWTRSearchTimelineDataSource(searchQuery: self.teamForSearch, APIClient: client)
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: self.teamForSearch, apiClient: client, languageCode: nil, maxTweetsPerRequest: 20)
        self.showTweetActions = true
        
        //Alert.DisplayInfoOKButton("Twitter Login Error", message: error!.localizedDescription, actionTitle: "OK", controller: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
