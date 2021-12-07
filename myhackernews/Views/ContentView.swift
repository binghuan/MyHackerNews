//
//  ContentView.swift
//  myhackernews
//
//  Created by BH_Lin on 2021/12/4.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
            })
    }
}

let MAX_ITEMS = 100

struct ContentView: View {
    
    @State var items = [Item]()
    @State var itemIdsByRank = [Int]()
    @State var progressStatus = ""
    
    @State var selectedSortingMethod = 0
    
    func onSortingMethodChanged(_ tag: Int) {
        print("Method tag: \(tag)")
        if(tag == 0) {// sort by Rank
            print("Sort Item by Rank")
            items = items.sorted(by: { $0.rank! < $1.rank! })
        } else {// sort by Date
            print("Sort Item by Date")
            items = items.sorted(by: { $0.time > $1.time })
        }
    }
    
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack{
            Text("My HackerNews").font(.title)
            Picker(selection: $selectedSortingMethod.onChange(onSortingMethodChanged), label: Text("Sorting By?")) {
                Text("By Rank").tag(0)
                Text("By Date").tag(1)
            }.pickerStyle(.segmented)
            
            if(items.count > 0) {
                ItemListView(items: items)
            } else {
                Spacer()
                HStack{
                    Text("Loading ...")
                    Text("\(progressStatus)")
                }
                Spacer()
            }
        }.onAppear(perform: {
            DataRequester.fetchNewStories(maxNumberOfItems: MAX_ITEMS,  progressString: { progressStatus in
                self.progressStatus = progressStatus
            }, completion: { (items) in
                print("------- fetchNewStories -------")
                self.items = items
                onSortingMethodChanged(selectedSortingMethod)
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: dummyItems)
    }
}
