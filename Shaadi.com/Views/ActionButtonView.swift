//
//  ActionButtonView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import SwiftUI

struct ActionButtonsView: View {
    let onAccept: () -> Void
    let onDecline: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onAccept) {
                Text("Accept")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: onDecline) {
                Text("Decline")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
