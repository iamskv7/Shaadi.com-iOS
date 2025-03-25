//
//  PersistenceServiceProtocol.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import Foundation

protocol PersistenceServiceProtocol {
    func addUser(_ user: User, status: String)
    func updateUserStatus(uuid: String, status: String)
    func fetchUsers() -> [UserEntity]
}
