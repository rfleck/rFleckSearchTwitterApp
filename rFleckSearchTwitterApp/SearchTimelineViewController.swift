//
//  SearchTimelineViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/23/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

// Swift
// SearchTimelineViewController.swift
import Foundation
import UIKit
import TwitterKit

class SearchTimelineViewController: TWTRTimelineViewController {
    var searchString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: searchString, apiClient: client)
    }
    
    func setStringSearch(_ mySearch: String) {
        self.searchString = mySearch
    }
}
