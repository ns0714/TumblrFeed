//
//  ViewController.swift
//  TumblerFeed
//
//  Created by Neha Samant on 10/12/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var photosTableView: PhotoTableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getTumblrFeed()
        photosTableView.dataSource = self
        photosTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getTumblrFeed() {
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    
                    // Go inside our response dictionary and find array of posts   
                    let responseDictionary = responseDictionary["response"] as? NSDictionary
                    
                    // Now go ahead and grab posts
                    let posts = responseDictionary?["posts"] as? [NSArray]
                    
                    // Set the posts here by iterating through posts and adding post via Post(blogName: ..., imageUrl: ...)
                    for i in posts {
                        
                    }
                }
            }
        });
        task.resume()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // We need to grab the cell from the storyboard and tableview
        let photoCell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        return photoCell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let photoDetailViewController = storyboard?.instantiateViewController(withIdentifier: "photoDetailViewController") as! PhotosDetailController
        navigationController?.pushViewController(photoDetailViewController, animated: true)
    }

}

