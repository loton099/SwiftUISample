//
//  User.swift
//  SwiftUISample
//
//  Created by Shakti Prakash Srichandan on 01/07/23.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
