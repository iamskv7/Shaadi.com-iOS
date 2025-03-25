//
//  NetworkServiceProtocol.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
