//
//  UserDetailModel.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import Foundation

struct UserResponse: Codable {
    let results: [User]
}

struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: DOB
    let phone: String
    let cell: String
    let picture: Picture
    let login: Login
    @IgnoreCodable var status: String = "Pending"
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Location: Codable {
        let city: String
        let state: String
        let country: String
    }
    
    struct DOB: Codable {
        let date: String
        let age: Int
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    struct Login: Codable {
        let uuid: String
    }
}

