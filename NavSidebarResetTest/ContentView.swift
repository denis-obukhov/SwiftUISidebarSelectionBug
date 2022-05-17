//
//  ContentView.swift
//  NavSidebarResetTest
//
//  Created by Denis Obukhov on 17.05.2022.
//

import SwiftUI

struct ItemGroup: Identifiable {
    let id: Int
    let items: [Item]
}

struct Item: Identifiable {
    let id: Int
}

let groups = [
    ItemGroup(id: 0, items: (0..<10).map(Item.init(id:))),
    ItemGroup(id: 1, items: (11..<21).map(Item.init(id:)))
]

struct ContentView: View {
    @AppStorage("LAST_GROUP_ID") var groupID: Int?
    
    var body: some View {
        NavigationView {
            List(groups) { group in
                NavigationLink(
                    tag: group.id,
                    selection: $groupID) {
                        ItemsList(group: group)
                    } label: {
                        Text("Group #\(group.id)")
                    }
            }
            
            Text("No selection")
        }
        .onChange(of: groupID) { newValue in
            // The issue if groupID is nil when DetailView is opened for iPad/MacCatalyst
            print("⚠️ Group id = \(String(describing: groupID))")
        }
    }
}

struct ItemsList: View {
    let group: ItemGroup
    @AppStorage("LAST_ITEM_ID") var itemID: Int?
    
    var body: some View {
        List(group.items) { item in
            NavigationLink(
                tag: item.id,
                selection: $itemID) {
                    DetailView(item: item)
                } label: {
                    Text("Item #\(item.id)")
                }
        }
    }
}

struct DetailView: View {
    let item: Item
    
    var body: some View {
        Text("Deatils of item #\(item.id)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
