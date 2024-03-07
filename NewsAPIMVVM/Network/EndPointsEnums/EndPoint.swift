//
//  EndPoints.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import Foundation

enum PathURL: String{
    case BASE_URL = "https://newsapi.org/v2/top-headlines?"
    //bu api key nasil saklanir?
    case API_KEY = "486305c8aae54d56bfca2dab220d9de5"
}
//burda source diye farkli bir enum olusturup farkli farkli sourcelari listeyebilirsin.
enum EndPoints: String {
    case bbcSources = "sources=bbc-news&apiKey="
    
    static func getSourcePath() -> String {
        return "\(PathURL.BASE_URL.rawValue)\(EndPoints.bbcSources.rawValue)\(PathURL.API_KEY.rawValue)"
    }
}
