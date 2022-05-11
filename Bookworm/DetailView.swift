//
//  DetailView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 11.05.2022.
//

import SwiftUI

struct DetailView: View {
	
	let book: Book
	
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
		}
    }
}


