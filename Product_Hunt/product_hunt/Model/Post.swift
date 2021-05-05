//
//  Post.swift
//  product_hunt
//
//  Created by X Y on 4/22/21.
//

import Foundation

//A product retrieved from the product Hunt API.
struct Post {
    // Various properties of a post that we either need or want to display
    let id: Int
    let name: String
    let tagline: String
    
    let votesCount: Int
    let commentsCount: Int
    let previewImageURL: URL
    
}
//Have a matching decodable array in our struct for the array of posts we get back from the API
struct PostList: Decodable {
    var posts: [Post]
}

// MARK: Decodable
extension Post: Decodable {
    
    //Properties within a post returned from the product hunt API that we want to extract the info from
    enum  PostKeys: String, CodingKey {
        //First three match our variable names for our post struct
        case id
        case name
        case tagline
        //These three need to be mapped since they're named differently on the API compared to our struct
        case votesCount = "votes_count"
        case commentsCount = "comments_count"
        case previewImageURL = "screenshot_url"

    }
    
    enum PreviewImageURLKeys: String, CodingKey {
        // only want the 850px image
        case imageURL = "850px"
}
    
    init(from decoder: Decoder) throws {
        let postsContainer = try decoder.container(keyedBy: PostKeys.self)
        // Decode each of the properties from the API into the appropriate type (string, etc.) for their associated struct variable
        id = try postsContainer.decode(Int.self, forKey: .id)
        name = try postsContainer.decode(String.self, forKey: .name)
        tagline = try postsContainer.decode(String.self, forKey: .tagline)
        votesCount = try postsContainer.decode(Int.self, forKey: .votesCount)
        commentsCount = try postsContainer.decode(Int.self, forKey: .commentsCount)
        
        
        let screenshotsURLContainer = try postsContainer.nestedContainer(keyedBy: PreviewImageURLKeys.self, forKey: .previewImageURL)
        //Decode the image and assign it to the variable
        previewImageURL = try screenshotsURLContainer.decode(URL.self, forKey: .imageURL)
    }
}
