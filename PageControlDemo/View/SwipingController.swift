//
//  SwipingController.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/7/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    
    private let previousButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(didTapPrevious), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.blueColor, for: .normal)
        button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.blueColor
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPage = 0
        pageControl.numberOfPages = Dota2Heroes.allCases.count
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlLayout()
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.isPrefetchingEnabled = false
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.pageCellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dota2Heroes.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.pageCellIdentifier, for: indexPath) as! PageCell
        let heroe = Dota2Heroes(rawValue: indexPath.item)!
        cell.imageView.transition(image: heroe.image)
        cell.heroeDescription = (heroe.name, heroe.description)
        return cell
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xScrollViewPosition = Int(targetContentOffset.pointee.x)
        pageControl.currentPage = xScrollViewPosition / Int(view.frame.width)
    }
    
    //Fix issues for landscape device orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
        })
    }
    
    @objc func didTapNext() {
        let nextIndex = min(pageControl.currentPage + 1, Dota2Heroes.allCases.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func didTapPrevious() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
    
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
