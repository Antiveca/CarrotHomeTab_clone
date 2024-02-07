//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/29.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {
    
    //User
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userTemperature: UILabel!
    
    //Item
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var itemInfoTitle: UILabel!
    @IBOutlet weak var itemInfoDescription: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    
    var viewModel: DetailViewModel!

    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
        setupUI()
        configureNavigationTabBar()
    }
    
    private func setupUI() {
        userThumbnail.layer.masksToBounds = true
        userThumbnail.layer.cornerRadius = 40
    }
    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap{ $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumnail))
                self.userName.text = details.user.name
                self.userLocation.text = details.user.location
                self.userTemperature.text = "\(details.user.temperature)ºC"
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.itemInfoTitle.text = details.item.title
                self.itemInfoDescription.text = details.details.descriptions
                self.itemPriceLabel.text = "\(self.formatNumber(details.item.price))원"
            }.store(in: &subscriptions)
    }
    
    private func configureNavigationTabBar() {
        let shareConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "square.and.arrow.up"),
            handler: { }
        )
        let shareItem = UIBarButtonItem.generate(
            with: shareConfig,
            width: 30
        )
        
        let moreConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "ellipsis"),
            handler: { }
        )
        let moreItem = UIBarButtonItem.generate(
            with: moreConfig,
            width: 30
        )
        navigationItem.rightBarButtonItems = [moreItem, shareItem]
    }
}

extension DetailViewController {
    private func formatNumber(_ price: Int) -> String { //숫자를 가격을 확인하기 쉽게 쉼표를 표시
        let numFomat = NumberFormatter()
        
        numFomat.numberStyle = .decimal
        let result = numFomat.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
