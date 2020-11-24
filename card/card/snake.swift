//
//  snake.swift
//  card
//
//  Created by Eatmyself on 2020/11/23.
//

import Foundation

struct snake: Identifiable,Codable {
    let id = UUID()
    var pic: Int
    var name: String
    var weight: Int
    var birthday:Date
    var lastfeed:Date
    var gender:Bool
}
