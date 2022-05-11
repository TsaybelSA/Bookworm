//
//  DetailView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 11.05.2022.
//

import SwiftUI

struct DetailView: View {
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	let book: Book
	
	@State private var showingDeleteAlert = false
	
    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				Image(book.genre ?? "Fantasy")
					.resizable()
					.scaledToFit()
				
				Text(book.genre?.uppercased() ?? "FANTASY")
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundColor(.white)
					.background(.ultraThinMaterial)
					.clipShape(Capsule())
					.offset(x: -5, y: -5)
			}
			
			Text(book.author ?? "Unknown author")
				.font(.title)
				.foregroundColor(.secondary)
			
			Text(book.review ?? "No review")
				.padding()
			
			RatingView(rating: .constant(Int(book.rating)))
				.font(.title)
			
			Text(book.date ?? Date.now, format: Date.FormatStyle(date: .abbreviated, time: .omitted))
				.font(.subheadline)
				.foregroundColor(.secondary)
				.padding()
		}
		.navigationTitle(book.title ?? "Unknown title")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Delete book?", isPresented: $showingDeleteAlert) {
			Button("Delete", role: .destructive, action: deleteBook)
			Button("Cancel", role: .cancel) {}
		} message: {
			Text("Are you sure?")
		}
		.toolbar {
			Button {
				showingDeleteAlert = true
			} label: {
				Label("Delete this book", systemImage: "trash")
			}
		}
    }
	
	func deleteBook() {
		moc.delete(book)
		
//		moc.save()
		dismiss()
	}
}


