//
//  LauncherManager.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/7/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class LauncherManager {
    static func setupMain(on window: UIWindow?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        window?.rootViewController = swipingController
    }
}
