//
//  TweetViewController.swift
//  Smashtag
//
//  Created by Le Nhu Ngoc on 5/5/16.
//  Copyright (c) 2016 ChillBears. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        // reset any existing tweet information
        contentLabel?.attributedText = nil
        nameLabel?.text = nil
        imageView?.image = nil
        dateLabel?.text = nil
        //        tweetCreatedLabel?.text = nil
        
        // load new information from our tweet (if any)
        if let tweet = self.tweet
        {
            contentLabel?.text = tweet.text
            if contentLabel?.text != nil  {
                for _ in tweet.media {
                    contentLabel.text! += " 📷"
                }
            }
            
            nameLabel?.text = "\(tweet.user)" // tweet.user.description
            
            if let profileImageURL = tweet.user.profileImageURL {
                let qos = Int(QOS_CLASS_USER_INITIATED.value)
                dispatch_async(dispatch_get_global_queue(qos, 0), { () -> Void in
                    if let imageData = NSData(contentsOfURL: profileImageURL) { // blocks main thread!
                        dispatch_async(dispatch_get_main_queue()) {
                            if profileImageURL == self.tweet?.user.profileImageURL {
                                self.imageView?.image = UIImage(data: imageData)
                            } else {
                                self.imageView?.image = nil
                            }
                        }
                    }
                })
                
                
            }
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
            dateLabel?.text = formatter.stringFromDate(tweet.created)
//                        let formatter = NSDateFormatter()
//                        if NSDate().timeIntervalSinceDate(tweet.created) > 24*60*60 {
//                            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
//                        } else {
//                            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
//                        }
//                        tweetCreatedLabel?.text = formatter.stringFromDate(tweet.created)
        }
        
    }


}
