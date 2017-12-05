//
//  etkinlikVC.swift
//  SelcukUniversitesi
//
//  Created by HAKAN on 13.12.2016.
//  Copyright © 2016 HAKAN. All rights reserved.
//

import UIKit

class etkinlikVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.selectedIndex = 3
        
        
        // MARK: Title
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        setupCollectionView()
        setupMenuBar()
        
        
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(duyurularCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false

        collectionView?.isPagingEnabled = true
    }
    
    
    lazy var menuBar: etkinlikMenuBar = {
        let mb = etkinlikMenuBar()
        mb.etkVC = self
        return mb
    }()
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    private func setupMenuBar(){
        
        //MARK: statusbar
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = navigationController?.navigationBar.barTintColor
        view.addSubview(statusBarBackgroundView)
        statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        view.addConstraintsWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
        statusBarBackgroundView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        
        //MARK: swipeBar_NavigationBarBack
        let swipeBar = UIView()
        swipeBar.backgroundColor = navigationController?.navigationBar.barTintColor
        view.addSubview(swipeBar)
        swipeBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: swipeBar)
        view.addConstraintsWithFormat(format: "V:[v0(70)]", views: swipeBar)
        
        
        //navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizantalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
