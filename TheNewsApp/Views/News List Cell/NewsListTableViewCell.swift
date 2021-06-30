//
//  NewsListTableViewCell.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Kingfisher

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var anImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.superview?.awakeFromNib()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
    }
    
    func config(viewModel: NewsItemViewModeling) {
        titleLabel.text = viewModel.title
        sourceLabel.text = viewModel.source
        if let url = viewModel.imageUrl {
            anImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
        }
        titleLabel.isHidden = titleLabel.text == nil
        sourceLabel.isHidden = sourceLabel.text == nil
    }
    
}

