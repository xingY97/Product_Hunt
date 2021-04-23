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
    
    var mockData: [Post] = {
       var meTube = Post(id: 0, name: "MeTube", tagline: "Stream videos for free!", votesCount: 25, commentsCount: 4)
       var boogle = Post(id: 1, name: "Boogle", tagline: "Search anything!", votesCount: 1000, commentsCount: 50)
       var meTunes = Post(id: 2, name: "meTunes", tagline: "Listen to any song!", votesCount: 25000, commentsCount: 590)

       return [meTube, boogle, meTunes]
    }()



}

// Mark: UITableViewDataSource

extension FeedViewController: UITableViewDataSource {
    
    //Determines how many cells will be shown on the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    // creates and configures each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        
        // grab a post from our mockdata
        let post = mockData[indexPath.row]
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
