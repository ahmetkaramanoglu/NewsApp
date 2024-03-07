//
//  NewsTableViewCell.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import UIKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {

    static let identifier = String(describing: NewsTableViewCell.self)
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsAuthorLbl: UILabel!
    
    @IBOutlet weak var newsTitleLbl: UILabel!
    
    
    @IBOutlet weak var newsDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(_ article: Articles) {
        newsImageView.kf.setImage(with: article.urlToImage?.asUrl)
        newsAuthorLbl.text = article.author
        newsTitleLbl.text = article.title
        newsDescriptionLbl.text = article.description
    }
    
}
