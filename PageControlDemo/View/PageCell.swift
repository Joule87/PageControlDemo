//
//  PageCell.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/7/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//
import UIKit

class PageCell: UICollectionViewCell {
    
    static let pageCellIdentifier = "PageCell"
    
    var heroeDescription: (name: String?, description: String?) {
        didSet {
            let attributeText = NSMutableAttributedString(string: "\(heroeDescription.name ?? "")\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
            attributeText.append(NSAttributedString(string: "\(heroeDescription.description ?? "")", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributeText
            descriptionTextView.textAlignment = .center
        }
    }
    
    let imageView: CustomUIImageViewAnimate = {
        let imageView = CustomUIImageViewAnimate()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let topImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupLayout() {
        backgroundViewsLayout()
        imageViewLayout()
        descriptionTextViewLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backgroundViewsLayout() {
        addSubview(topImageContainerView)
        [topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
         topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
         topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor),
         topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor)].forEach { $0.isActive = true}
        
        addSubview(bottomImageContainerView)
        [bottomImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
         bottomImageContainerView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
         bottomImageContainerView.leftAnchor.constraint(equalTo: leftAnchor),
         bottomImageContainerView.rightAnchor.constraint(equalTo: rightAnchor),
         bottomImageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)].forEach { $0.isActive = true}
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
