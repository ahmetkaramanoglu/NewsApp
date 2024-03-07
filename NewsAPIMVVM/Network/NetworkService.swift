//
//  NetworkService.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import Foundation
import Alamofire

protocol NewsAPIInterface {
    func fetchSourceArticle(response: @escaping ([Articles]?) -> Void)
}

final class NewsAPIService: NewsAPIInterface {
    func fetchSourceArticle(response: @escaping ([Articles]?) -> Void) {
        AF.request(EndPoints.getSourcePath(), method: .get).response { model in
            guard let data = model.data else {
                response(nil)
                return
            }
            do{
                let resp = try JSONDecoder().decode(SourcePostModel.self, from: data)
                response(resp.articles)
                
            }catch{
                response(nil)
                print(error)
            }
        }
    }
    
    
}
