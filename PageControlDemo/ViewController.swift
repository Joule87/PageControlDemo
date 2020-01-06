//
//  ViewController.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/5/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "balanar"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        
        let attributeText = NSMutableAttributedString(string: "NIGHT STALKER \n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
        attributeText.append(NSAttributedString(string: "Of the Night Stalker, there is no history, only stories. There are ancient tales woven into the lore of every race and every culture, of an impossible time before sunlight and daytime, when night reigned alone and the world was covered with the creatures of darkness--creatures like Balanar the Night Stalker.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributeText
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let topImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.blueColor, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.blueColor
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        backgroundViewsLayout()
        imageViewLayout()
        descriptionTextViewLayout()
        pageControlLayout()
    }
    
    private func pageControlLayout() {
        
        let bottomControllStackView  = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControllStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControllStackView.axis = .horizontal
        bottomControllStackView.distribution = .fillEqually
        view.addSubview(bottomControllStackView)
        
        NSLayoutConstraint.activate([bottomControllStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        bottomControllStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bottomControllStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottomControllStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func backgroundViewsLayout() {
        view.addSubview(topImageContainerView)
        [topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
         topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
         topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
         topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach { $0.isActive = true}
        
        view.addSubview(bottomImageContainerView)
        [bottomImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
         bottomImageContainerView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
         bottomImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
         bottomImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
         bottomImageContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)].forEach { $0.isActive = true}
    }
    
    func imageViewLayout() {
        topImageContainerView.addSubview(imageView)
        [imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
         imageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
         imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
         imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor)].forEach { $0.isActive = true}
    }
    
    func descriptionTextViewLayout() {
        bottomImageContainerView.addSubview(descriptionTextView)
        [descriptionTextView.centerXAnchor.constraint(equalTo: bottomImageContainerView.centerXAnchor),
         descriptionTextView.topAnchor.constraint(equalTo: bottomImageContainerView.topAnchor),
         descriptionTextView.leftAnchor.constraint(equalTo: bottomImageContainerView.leftAnchor, constant: 24),
         descriptionTextView.rightAnchor.constraint(equalTo: bottomImageContainerView.rightAnchor, constant: -24),
         descriptionTextView.bottomAnchor.constraint(equalTo: bottomImageContainerView.bottomAnchor, constant: 0)].forEach { $0.isActive = true}
        
    }
    
}

