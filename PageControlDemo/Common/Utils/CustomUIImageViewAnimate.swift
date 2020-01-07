//
//  CustomUIImageViewAnimate.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/7/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class CustomUIImageViewAnimate: UIImageView {
    func transition(image: UIImage?) {
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.image = image
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (_) in
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.transform = .identity
            })
        }
    }
}
