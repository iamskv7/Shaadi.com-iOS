//
//  StatusTextView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//
import SwiftUI

struct StatusTextView: View {
    let message: String
    let color: Color
    
    var body: some View {
        Text(message)
            .font(.headline)
            .foregroundColor(color)
    }
}
