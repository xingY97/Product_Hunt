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
    
}
