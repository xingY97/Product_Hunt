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


}

// Mark: UITableViewDataSource

extension FeedViewController: UITableViewDataSource {
    
    //Determines how many cells will be shown on the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // creates and configures each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

// Mark: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    
    //code to handel cell events goes here
    
}
