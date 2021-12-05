//
//  Data.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import Foundation

import SwiftUI

func generateDummyItems() -> [Item] {
    
    var items: [Item] = []
    for index in 1...10 {
        let item = Item(id: Int64(index), type: "story", by: "BH_Lin", time: 1638621351785, title: "A Title blablabla", url: "http://www.google.com", score: 3, descendants: 10)
        items.append(item)
    }
    
    return items
}

let dummyItems: [Item] = generateDummyItems()
