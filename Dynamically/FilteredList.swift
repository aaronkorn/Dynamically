//
//  FilteredList.swift
//  Dynamically
//
//  Created by AARON KORN on 1/28/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
  
  @Environment(\.managedObjectContext) var moc
  
  var fetchRequest: FetchRequest<T>
  
  var singers: FetchedResults<T> { fetchRequest.wrappedValue }
  
  // this is our content closure; we'll call this once for each item in the list
  let content: (T) -> Content
  
  init(filterKey: String,
       filterValue: String,
       @ViewBuilder content: @escaping (T) -> Content) {
    
    fetchRequest =
      FetchRequest<T>(
        entity: T.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
    
    self.content = content
  }//init
  
  var body: some View {
    List {
      ForEach(fetchRequest.wrappedValue, id: \.self) { singer in
        self.content(singer)
      }//ForEach
        .onDelete(perform: removeAccount)
    }//List
  }//body
  
  func removeAccount(at offsets: IndexSet) {
    for index in offsets {
      let oneSinger = singers[index]
      moc.delete(oneSinger)
    }//for
    try? self.moc.save()
  }//removeTransaction
}//FilteredList

struct FilteredList_Previews: PreviewProvider {
  static var previews: some View {
    FilteredList(filterKey: "lastName", filterValue: "A") { (singer: Singer) in
      Text("Hello, World!")
    }//FilteredList
  }//previews
}//FilteredList_Previews
