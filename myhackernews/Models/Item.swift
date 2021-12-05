//
//  Item.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import Foundation

struct Item: Decodable,Hashable {
    var rank: Int?
    let id: Int64 // The item's unique id.
    let type:String // The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    let by: String // The username of the item's author.
    let time: Int64 // Creation date of the item, in Unix Time.
    let title:String // The title of the story, poll or job. HTML.
    let url: String? // The URL of the story.
    let score: Int // The story's score, or the votes for a pollopt.
    let descendants: Int // In the case of stories or polls, the total comment count.
}
