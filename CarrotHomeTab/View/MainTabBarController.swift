//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by ByeongGuk Choi on 2024/01/29.
//

import UIKit

//탭마다 다른 네비게이션바를 나타냄(탭 감지 > 네비게이션바 업데이트)
//홈: 타이틀, 서치, 피드
//동네 활동: 타이틀, 피드
//내 근처: 타이틀
//채팅: 타이틀, 피드
//나의 당근: 타이틀, 설정

//앱이 시작될 때 네이게이션바 버튼 아이템 설정을 완료해야함

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }

    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
        case is HomeViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "덕계동",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            navigationItem.leftBarButtonItem = titleItem
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print("---> search") }
            )
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig,
                width: 30
            )
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> feed") }
            )
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "덕계동",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            navigationItem.leftBarButtonItem = titleItem
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> feed") }
            )
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            navigationItem.rightBarButtonItems = [feedItem]
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            navigationItem.leftBarButtonItem = titleItem
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> feed") }
            )
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            navigationItem.rightBarButtonItems = [feedItem]
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            navigationItem.leftBarButtonItem = titleItem
            
            let setConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape"),
                handler: { print("---> feed") }
            )
            let setItem = UIBarButtonItem.generate(
                with: setConfig,
                width: 30
            )
            navigationItem.rightBarButtonItems = [setItem]
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "덕계동",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
        }
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) { //선택된 탭바 감지
        updateNavigationItem(vc: viewController)
    }
}
