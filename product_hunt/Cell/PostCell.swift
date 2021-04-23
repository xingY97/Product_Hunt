//
//  PostTableViewCell.swift
//  product_hunt
//
//  Created by X Y on 4/23/21.
//

import UIKit

class PostCell: UITableViewCell {



    @IBOutlet weak var voteCounts: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    //didSet will be called everytime post variable is set
    var post: Post? {
        didSet {
            //Make sure we return if post doesn't exist
            guard let post = post else { return }
            //assign out UI elements to their post counterparts
            nameLabel.text = post.name
            taglineLabel.text = post.tagline
            commentsCount.text = "Comments: \(post.commentsCount)"
            voteCounts.text = "Votes: \(post.votesCount)"
            
            updatePreviewImage()
            
        }
    }
    
    func updatePreviewImage() {
        //make sure we return if post doesnt exist
        guard let post = post else { return }
        //assisn the placeholder image to the ui element
        previewImageView.image = UIImage(named: "placeholder")
    }
}
