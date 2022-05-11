//
//  ContentView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 10.05.2022.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	
	@FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
	
	@State private var showingAddBookScreen = false
	
    var body: some View {
		NavigationView {
			Text("Count is: \(books.count)")
				.navigationTitle("Bookworm")
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							showingAddBookScreen.toggle()
						} label: {
							Label("Add Book", systemImage: "plus")
						}
					}
				}
				.sheet(isPresented: $showingAddBookScreen) {
					AddBookView()
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
