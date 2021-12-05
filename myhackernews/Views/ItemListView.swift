//
//  ItemListView.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import SwiftUI

struct ItemListView: View {
    
    var items: [Item]
    let currentDate = NSDate()
    
    var body: some View {
        ScrollView {
            ForEach(items, id: \.self) { item in
                ItemView(item: item, currentDate: currentDate)
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(items: dummyItems)
    }
}
