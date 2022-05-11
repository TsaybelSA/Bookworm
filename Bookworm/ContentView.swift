//
//  ContentView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 10.05.2022.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	
	@FetchRequest(sortDescriptors: [
		SortDescriptor(\.title),
		SortDescriptor(\.author, order: .reverse)
	]) var books: FetchedResults<Book>
	
	@State private var showingAddBookScreen = false
	
    var body: some View {
		NavigationView {
			List {
				ForEach(books, id: \.self) { book in
					NavigationLink {
						DetailView(book: book)
					} label: {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							VStack(alignment: .leading) {
								Text(book.title ?? "Unknown title")
									.font(.headline)
									.foregroundColor(book.rating < 2 ? .red : .primary)
								
								Text(book.author ?? "Unknown author")
									.foregroundColor(.secondary)
								
							}
						}
					}
					
				}
				.onDelete(perform: deleteBooks)
			}
			.navigationTitle("Bookworm")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				}
				
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
	
	private func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			let book = books[offset]
			moc.delete(book)
		}
		try? moc.save()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
