//
//  MenuCell.swift
//  SelcukUniversitesi
//
//  Created by HAKAN on 15.12.2016.
//  Copyright © 2016 HAKAN. All rights reserved.
//

import UIKit



class MenuCell: BaseCell {
    let iLabel: UILabel = {
        let il = UILabel()
        il.text = ("DUYURULAR")
        il.font = UIFont.systemFont(ofSize: 15)
        il.textColor = UIColor.lightGray
        il.textAlignment = .center
        il.translatesAutoresizingMaskIntoConstraints = false
        il.isHighlighted = true
        
        return il
    }()
    
    
    override var isHighlighted: Bool {
        didSet{
            iLabel.textColor = isHighlighted ? UIColor.white : UIColor.lightGray
        }
    }
    
    override var isSelected: Bool {
        didSet{
            iLabel.textColor = isSelected ? UIColor.white : UIColor.lightGray
        }
    }
    
    override func setupViews() {
        super.setupViews()
    
        addSubview(iLabel)
        addConstraintsWithFormat(format: "H:[v0(115)]", views: iLabel)
        addConstraintsWithFormat(format: "V:[v0(50)]", views: iLabel)
        
        addConstraint(NSLayoutConstraint(item: iLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        
    }
    
}
