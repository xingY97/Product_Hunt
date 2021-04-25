//
//  FeedViewController.swift
//  product_hunt
//
//  Created by X Y on 4/22/21.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        feedTableView.dataSource = self
        feedTableView.delegate = self
        
       
    }
    
    func updateFeed(){
        networkManager.getPosts { result in
            self.posts = result
        }
    }
    
    var posts: [Post] = [] {
        didSet {
            feedTableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()



}

// Mark: UITableViewDataSource

extension FeedViewController: UITableViewDataSource {
    
    //Determines how many cells will be shown on the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // creates and configures each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        
        // retrieve from the actual posts
        let post = posts[indexPath.row]
        //Assign a post to that cell
        cell.post = post
        //return UITableViewCell()
        return cell
    }
    
}

// Mark: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    
    //code to handel cell events goes here
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // provide a fixed size
        return 250
    }
    
}
