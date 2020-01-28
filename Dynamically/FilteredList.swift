//
//  FilteredList.swift
//  Dynamically
//
//  Created by AARON KORN on 1/28/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct FilteredList: View {
  
  var fetchRequest: FetchRequest<Singer>
  
  //var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
  
  init(filter: String) {
    fetchRequest =
      FetchRequest<Singer>(
        entity: Singer.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
  }//init
  
  var body: some View {
    List(fetchRequest.wrappedValue, id: \.self) { singer in
      
      Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
      
    }//List
  }//body
}//FilteredList

struct FilteredList_Previews: PreviewProvider {
  static var previews: some View {
    FilteredList(filter: "A")
  }
}//FilteredList_Previews
