//
//  BaseCell.swift
//  SelcukUniversitesi
//
//  Created by HAKAN on 15.12.2016.
//  Copyright © 2016 HAKAN. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    func setupViews(){
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}