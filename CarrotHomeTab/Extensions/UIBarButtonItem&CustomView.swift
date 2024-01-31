//
//  UIBarButtonItem&CustomView.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/31.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    //https://babbab2.tistory.com/122
    //static 키워드에 대한 설명 블로그
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
}
