//
//  UserImageView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//
import SwiftUI

struct UserImageView: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
        } placeholder: {
            ProgressView()
        }
        .cornerRadius(12)
    }
}
