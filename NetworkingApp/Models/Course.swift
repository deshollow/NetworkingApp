//
//  Course.swift
//  NetworkingApp
//
//  Created by deshollow on 14.11.2023.
//

import Foundation

struct Course: Codable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}

struct SwiftbookInfo: Decodable {
    let courses: [Course]
    let websiteDescription: String
    let websiteName: String
}

