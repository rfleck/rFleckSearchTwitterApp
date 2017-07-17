//
//  TweetTableViewDemoViewController.swift
//  rFleckSearchTwitterApp
//
//  Created by Roberson Fleck on 10/23/15.
//  Copyright © 2015 Roberson Fleck. All rights reserved.
//

// Swift
import Foundation
import TwitterKit

class TweetTableViewDemoViewController: UITableViewController, TWTRTweetViewDelegate {
    let tweetTableReuseIdentifier = "TweetCell"
    
    // Hold all the loaded Tweets
    var tweets: [TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let tweetIDs = ["20", "Chicago Bulls"]
    
    override func viewDidLoad() {
        print("App Started !")
        
        // Setup the table view
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Explicitly set on iOS 8 if using automatic row height calculation
        tableView.allowsSelection = false
        tableView.register(TWTRTweetTableViewCell.self, forCellReuseIdentifier: tweetTableReuseIdentifier)
        
        // Load Tweets
        let client = TWTRAPIClient()
        client.loadTweets(withIDs: tweetIDs) { tweets, error in
            if let ts = tweets as? [TWTRTweet] {
                self.tweets = ts
            } else {
                print("Failed to load tweets: \(error!.localizedDescription)")
            }
        }
    }
    
    // MARK: UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweet = tweets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: tweetTableReuseIdentifier, for: indexPath) as! TWTRTweetTableViewCell
        cell.configure(with: tweet)
        cell.tweetView.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        return TWTRTweetTableViewCell.height(for: tweet, width: self.view.bounds.width)
    }
}
