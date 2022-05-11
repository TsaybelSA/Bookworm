//
//  RatingView.swift
//  Bookworm
//
//  Created by Сергей Цайбель on 10.05.2022.
//

import SwiftUI

struct RatingView: View {
	
	@Binding var rating: Int
	
	let label = ""
	let maximumRating = 5
	
	var offImage: Image?
	var onImage = Image(systemName: "star.fill")
	
	var offColor = Color.gray
	var onCOlor = Color.yellow
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: .constant(4))
    }
}
