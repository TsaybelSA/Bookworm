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
			List {
				ForEach(books, id: \.self) { book in
					NavigationLink {
						
					} label: {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							VStack(alignment: .leading) {
								Text(book.title ?? "Unknown title")
									.font(.headline)
								
								Text(book.author ?? "Unknown author")
									.foregroundColor(.secondary)
								
							}
						}
					}
					
				}
			}
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
