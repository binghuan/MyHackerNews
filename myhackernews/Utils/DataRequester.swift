//
//  DataRequester.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import Foundation

class DataRequester {
    
    static func fetchNewStories( maxNumberOfItems : Int , progressString: @escaping (String) -> Void, completion: @escaping ([Item]) -> Void ) {
        print("+++ fetchNewStories +++")
        
        let urlString = URL(string: "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty")
        let dataTask = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let responseData = data else {
                return
            }
            if let jsonString = String(data: responseData, encoding: .utf8) {
                let data = Data(jsonString.utf8)
                do {
                    let kids = try JSONSerialization.jsonObject(with: data) as! [NSNumber]
                    
                    // Slice Array
                    let itemsToAcquire = Array(kids[0 ..< maxNumberOfItems])
                    
                    fetchItems(itemIds: itemsToAcquire, onProgress: { progress in
                        progressString("\(progress)/\(itemsToAcquire.count)")
                    }, completion: { items in
                        print("OK> All items are fetched!")
                        completion(items)
                    })
                    
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
    static func fetchItems( itemIds : [NSNumber], onProgress: @escaping (Int) -> Void, completion: @escaping ([Item]) -> Void ) {
        var numbersOfRequest = 0;
        var numbersOfResponse = 0;
        let group = DispatchGroup()
        
        var items = [Item]()
        
        for (index, itemId) in itemIds.enumerated() {
            
            group.enter()
            numbersOfRequest += 1
            
            let startedDate = NSDate()
            fetchItemByID(itemId: itemId, rank: index, startedDate: startedDate, completion: { item in
                
                items.append(item)
                
                numbersOfResponse += 1
                onProgress(numbersOfResponse)
                //print("numbersOfResponse: \(numbersOfResponse)/\(numbersOfRequest)")
                
                group.leave()
            })
            
        }
        group.notify(queue: .main) {
            print("!! group.notify: \(numbersOfResponse)/\(numbersOfRequest)")
            completion(items)
        }
    }
    
    static func fetchItemByID(itemId: NSNumber, rank: Int, startedDate: NSDate, completion: @escaping ( Item ) -> Void) {
        let urlString = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(itemId).json?print=pretty")
        
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            
            guard let responseData = data else {
                return
            }
            
            do {
                var item = try JSONDecoder().decode(Item.self, from: responseData)
                //print("Item=\(response)")
                item.rank = rank
                completion(item)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    static func getDiffTimeInString(diffInSeconds: Int) -> String {
        var remainingSeconds = diffInSeconds
        let oneMinute = 60
        let oneHour = 60 * 60
        
        var hours = 0
        var minutes = 0
        var seconds = 0
        while (Int(remainingSeconds / oneHour) >= 1) {
            hours = Int(remainingSeconds / oneHour)
            remainingSeconds = remainingSeconds - hours * oneHour
        }
        while (Int(remainingSeconds / oneMinute) >= 1) {
            minutes = Int(remainingSeconds / oneMinute)
            remainingSeconds = remainingSeconds - minutes * oneMinute
        }
        seconds = remainingSeconds
        
        var result:String = ""
        if(hours >= 2) {
            result = "\(hours) hours ago"
        } else if(hours > 0 && hours < 2) {
            result = "\(hours) hour ago"
        } else if(minutes > 0 && minutes < 2) {
            result = "\(minutes) minute ago"
        } else if(minutes >= 2) {
            result = "\(minutes) minutes ago"
        } else if(seconds > 0 && seconds < 2) {
            result = "\(seconds) second ago"
        } else if(seconds >= 2) {
            result = "\(seconds) seconds ago"
        }
        return result
    }
    
}
