//
//  Comment.swift
//  product_hunt
//
//  Created by X Y on 5/13/21.
//

import Foundation
struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
    let comments: [Comment]
}
