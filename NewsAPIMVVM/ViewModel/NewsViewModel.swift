//
//  NewsViewModel.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import Foundation

protocol NewsViewModelProtocol {
    var delegate: NewsViewModelDelegate? { get set}
    func viewDidLoad()
    func load()
    func selectNews(at index: Int)
}

enum NewsViewModelOutput {
    case setLoading(Bool)
    case showArticles([Articles])
}

final class NewsViewModel {
    weak var delegate: NewsViewModelDelegate?
    private var articles: [Articles] = []
    private var service: NewsAPIInterface!
    
    init(service: NewsAPIInterface) {
        self.service = service
    }
    
    private func notify(_ output: NewsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

extension NewsViewModel: NewsViewModelProtocol {
    func viewDidLoad() {
        delegate?.prepareTableView()
        load()
    }
    
    func load() {
        notify(.setLoading(true))
        service.fetchSourceArticle(response: { [weak self] response in
            guard let self else { return }
            self.notify(.setLoading(false))
            guard let response else { return }
            self.articles = response
            notify(.showArticles(response))
        })
    }
    
    func selectNews(at index: Int) {
        //TODO: Implement.
    }
    
    
}
