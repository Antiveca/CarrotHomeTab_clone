//
//  CustomBarItem.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/30.
//

import Foundation
import UIKit

struct CustomBarItemConfiguration { //init()으로 많은 파라미터를 받으므로 구조체를 만들어서 간결하게 만듬
    typealias Handler = () -> Void
    
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}

final class CustomBarItem:UIButton {
    var customBarItmeConfig: CustomBarItemConfiguration
    
    init(config: CustomBarItemConfiguration) {
        self.customBarItmeConfig = config
        super.init(frame: .zero)
        
        setStyle()
        updateConfig()
    }
    
    private func setStyle() { //스타일 설정
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
    }
    
    private func updateConfig() { //레이블, 이미지, 액션 설정
        self.setTitle(customBarItmeConfig.title, for: .normal)
        self.setImage(customBarItmeConfig.image, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) //#selector는 Objective-C와의 호환성을 위해 사용됨
    }
    
    @objc func buttonTapped() { //@objc는 Objective-C와의 호환성을 위해 사용됨
        customBarItmeConfig.handler()
    }
    required init?(coder: NSCoder) { //에러 메세지
        fatalError("init(coder:) has not been implemented")
    }
}
