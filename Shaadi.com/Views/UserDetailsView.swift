//
//  UserDetailsView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//
import SwiftUI

struct UserDetailsView: View {
    let name: String
    let location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
