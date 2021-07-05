//
//  NewsItemDetailsViewController.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Kingfisher
import SafariServices

class NewsItemDetailsViewController: UIViewController {

    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var navigationButton: UIButton!
    
    let viewModel: NewsDetailsViewModeling
    
    init(viewModel: NewsDetailsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, use init(viewModel:)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = viewModel.title
        setupLabel(publishDateLabel, value: viewModel.date)
        setupLabel(autherLabel, value: viewModel.author)
        setupLabel(descriptionLabel, value: viewModel.description)
        imageView.kf.setImage(with: viewModel.imageURL, placeholder: UIImage(named: "placeholder"))
        contentLabel.attributedText = viewModel.content
        navigationButton.isHidden = viewModel.url == nil
    }
    
    private func setupLabel(_ label: UILabel, value: String?) {
        label.text = value
        label.isHidden = value == nil
    }
    
    @IBAction func navigateToLink() {
        guard let url = viewModel.url else {
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
    
}
