//
//  NewsViewController.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import UIKit

protocol NewsViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: NewsViewModelOutput)
    func prepareTableView()
}

final class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articles: [Articles] = []
    lazy var viewModel = NewsViewModel(service: NewsAPIService())
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
    
}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        let article = articles[indexPath.row]
        cell.setup(article)
        
        return cell
    }
    
    
}

extension NewsViewController: NewsViewModelDelegate {
    func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func handleViewModelOutput(_ output: NewsViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showArticles(let articles):
            self.articles = articles
            tableView.reloadData()
        }
    }
    
    
}
