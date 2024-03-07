//
//  Articles.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import Foundation

struct Articles: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
}

struct Source: Codable{
    let id: String?
    let name: String?
}
