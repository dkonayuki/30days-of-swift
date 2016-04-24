//
//  ImageViewController.swift
//  Cassini
//
//  Created by dkonayuki on 4/20/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    // get a new image whenever imageURL changes
    private func fetchImage() {
        if let url = imageURL {
            spinner?.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0), { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    // only display the image with correct url
                    if url == self.imageURL {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                }
            })
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self // for the delegate function
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            
        }
    }
    
    // delegate function
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    // dynamically create UIImageView
    private var imageView = UIImageView()
    
    // to do things when user set imageView
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit() // change the bounds accordingly to the new image
            
            // ? just to be safe
            scrollView?.contentSize = imageView.frame.size
            
            // when set, stop animating
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
}
