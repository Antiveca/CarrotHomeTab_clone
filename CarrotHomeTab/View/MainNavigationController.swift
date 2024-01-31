//
//  MainNabigationViewController.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/29.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImage(systemName: "arrow.backward")
        self.navigationBar.backIndicatorImage = backImage
        self.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationBar.tintColor = .white
    }
}
