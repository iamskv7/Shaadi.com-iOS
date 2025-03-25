//
//  MatchListView.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import SwiftUI

struct MatchListView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.users.isEmpty {
                    VStack(spacing: 20) {
                        Text("No Matches Available")
                            .font(.title2)
                            .foregroundColor(.gray)

                        Button(action: { viewModel.fetchUsers() }) {
                            Text("Retry")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.users, id: \.login.uuid) { user in
                                MatchCardView(
                                    user: user,
                                    onAccept: {
                                        viewModel.acceptUser(user)
                                    },
                                    onDecline: {
                                        viewModel.declineUser(user)
                                    }
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Matches")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}
