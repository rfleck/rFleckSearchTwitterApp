//
//  UserTimelineViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/23/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

// Swift
// UserTimelineViewController.swift
import Foundation
import UIKit
import TwitterKit

class UserTimelineViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "fabric", APIClient: client)
    }
}
