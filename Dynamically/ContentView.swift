//
//  ContentView.swift
//  Dynamically
//
//  Created by AARON KORN on 1/28/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//  Dynamically filtering @FetchRequest with SwiftUI
//  per: Paul Hudson @twostraws December 21st 2019
//  https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-fetchrequest-with-swiftui

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @State private var lastNameFilter = "A"
  
  var body: some View {
    VStack {
      // list of matching singers
      FilteredList(filterKey: "lastName", filterValue: lastNameFilter) {
        (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
      }//FilteredList
      
      Button("Add Examples") {
        let taylor = Singer(context: self.moc)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"
        
        let ed = Singer(context: self.moc)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"
        
        let adele = Singer(context: self.moc)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"
        
        try? self.moc.save()
      }//Button
      
      Button("Show A") {
        self.lastNameFilter = "A"
      }//Button
      
      Button("Show S") {
        self.lastNameFilter = "S"
      }//Button
      
    }//VStack
  }//body
}//ContentView

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}//ContentView_Previews
