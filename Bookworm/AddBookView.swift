//
//  AddBookView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 10.05.2022.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = "Fantasy"
	@State private var review = ""
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author`s name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section("Write a review") {
					TextField("Review", text: $review)
					
					RatingView(rating: $rating)
				}
				
				Section {
					Button("Save") {
						let newBook = Book(context: moc)
						newBook.id = UUID()
						newBook.title = title
						newBook.author = author
						newBook.genre = genre
						newBook.rating = Int16(rating)
						newBook.review = review
						newBook.date = Date.now
						
						try? moc.save()
						
						dismiss()
					}
					.disabled(!areTextFieldsValid())
				}
			}
			.navigationTitle("Add Book")
		}
    }
	
	private func areTextFieldsValid() -> Bool {
		if let _ = title.first(where: { $0 != " " }),
			let _ = author.first(where: { $0 != " " }),
			let _ = review.first(where: { $0 != " " }) {
				return true
		} else {
			return false
		}
	}
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
