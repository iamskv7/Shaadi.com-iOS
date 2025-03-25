//
//  MatchCardView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import SwiftUI

struct MatchCardView: View {
    let user: User
    let onAccept: () -> Void
    let onDecline: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // User Image Section
            UserImageView(imageUrl: user.picture.large)
            
            // User Details Section
            UserDetailsView(name: "\(user.name.first) \(user.name.last)",
                            location: "\(user.location.city), \(user.location.country)")
            
            // Status or Action Buttons Section
            if user.status == "Accepted" {
                StatusTextView(message: "Accepted", color: .green)
            } else if user.status == "Declined" {
                StatusTextView(message: "Declined", color: .red)
            } else {
                ActionButtonsView(onAccept: onAccept, onDecline: onDecline)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
