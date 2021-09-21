//
//  ContentView.swift
//  Book By Cover
//
//  Created by Zakee Tanksley on 9/20/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isPresented = false
    @State private var isbn: String?
    @State private var foundBooks: Books?
    
    var body: some View {
        
        ZStack {
       
            Image("BookShelf")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea( edges: .all)
            NavigationView {
                Form {
                    Section(header: Text ("About this Book")) {
                        Text("\(foundBooks?.items.first?.volumeInfo.title ?? "Title")")
                        Text("\(foundBooks?.items.first?.volumeInfo.subtitle ?? "Subtitle")")
                     //   Text("\(foundBooks?.items.first?.volumeInfo.authors ?? "Authors")")
                    }
                    Section(header: Text (" + Info")) {
                        Text("\(foundBooks?.items.first?.volumeInfo.publishDate ?? "Published")")
                        Text("\(foundBooks?.items.first?.volumeInfo.isbn ?? "isbn")")
                    
                }
                }.navigationTitle("􀫕 Info")
                .navigationBarItems(trailing: Button(action:
                                                {self.isPresented.toggle()})
                {
                    Image(systemName: "barcode")
                }.sheet(isPresented: $isPresented) {
                    barCodeScanner(isbn: $isbn, foundBooks: $foundBooks)
                }
            )}
    
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
