//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/02/07.
//

import Foundation

final class DetailViewModel {
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
    }
}
