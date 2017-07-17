//
//  ListTimelineViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/23/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//


// Swift
// ListTimelineViewController.swift
import Foundation
import UIKit
import TwitterKit

class ListTimelineViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRListTimelineDataSource(listSlug: "twitter-syndication-team", listOwnerScreenName: "benward", apiClient: client)
    }
}
