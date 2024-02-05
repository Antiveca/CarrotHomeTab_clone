//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/31.
//

import UIKit
import Kingfisher

class ItemInfoCell: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numOfChatLabel: UILabel!
    @IBOutlet weak var numOfLikeLabel: UILabel!
    
    override func awakeFromNib() { //인터페이스가 보여진 후? 적용됨
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
        thumbnail.layer.masksToBounds = true
        thumbnail.tintColor = .white
    }
    
    func configure(item: ItemInfo) {
        thumbnail.kf.setImage(
            with: URL(string: item.thumbnailURL),
            placeholder: UIImage(systemName: "hands.sparkles.fill") //placeholder는 로딩되지 않았을 때 출력될 이미지
        )
        
        titleLabel.text = item.title
        descriptionLabel.text = item.location
        priceLabel.text = "\(formatNumber(item.price))원"
        
        numOfChatLabel.text = "\(item.numOfChats)"
        numOfLikeLabel.text = "\(item.numOfLikes)"
    }
    
    
    private func formatNumber(_ price: Int) -> String { //숫자를 가격을 확인하기 쉽게 쉼표를 표시
        let numFomat = NumberFormatter()
        
        numFomat.numberStyle = .decimal
        let result = numFomat.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
