//
//  ItemView.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    
    let currentDate:NSDate
    func checkHowLongAgo(time: Int64) -> String {
        let diff = currentDate.timeIntervalSince1970 - Double(item.time)
        return getDiffTimeInString(diffInSeconds: Int(diff))
    }
    
    let DEFAULT_URL = "_"
    func isNeededToShowLink(url:String?) -> Bool {
        if(url == nil) {
            return false
        }
        return true
    }
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Link("\(item.title)", destination: URL(string: "\(item.url ?? DEFAULT_URL)")!)
                        .font(.title)
                        .lineLimit(1)
                    Spacer()
                }
                
                HStack{
                    Link("(\(item.url ?? DEFAULT_URL))", destination: URL(string: "\(item.url ?? DEFAULT_URL)")!)
                        .font(.subheadline)
                        .foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255)).lineLimit(1)
                        .disabled(isNeededToShowLink(url: item.url))
                    Spacer()
                }
            }
            HStack{
                Text("\(checkHowLongAgo(time: item.time))")
                Spacer()
                Text("by \(item.by)")
                Spacer()
                
            }.foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255)).font(.subheadline)
            
            HStack{
                if(item.score > 1) {
                    Text("\(item.score) points")
                } else {
                    Text("\(item.score) point")
                }
                Spacer()
                if(item.descendants > 1) {
                    Text("\(item.descendants) comments")
                } else {
                    Text("\(item.descendants) comment")
                }
            }.foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255)).font(.subheadline)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: dummyItems[0], currentDate: NSDate())
    }
}
