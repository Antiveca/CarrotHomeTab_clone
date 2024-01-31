//
//  HomeViewModel.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/31.
//

import Foundation
import Combine

final class HomeViewModel {
    let network: NetworkService
    
    @Published var items: [ItemInfo] = []
    var subscriptions = Set<AnyCancellable>()
    let itemTapped = PassthroughSubject<ItemInfo, Never>() //ItemInfo: 넘겨주는 값이 ItemInfo 중 하나의 값임, Never: 실패 경우 없음
    
    init(network: NetworkService) {
        self.network = network
        
    }
    
    func fetch() {
        let resource: Resource<[ItemInfo]> = Resource( //network 정보를 저장
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource) //network 정보를 넘겨줘서 값 추출
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let errer):
                    print("----> Error: \(errer)")
                case.finished:
                    print("----> finished")
                }
            } receiveValue: { items in
                self.items = items
            }.store(in: &subscriptions)
    }
}
