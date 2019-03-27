//
//  AlbumListCVCell.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class AlbumListCVCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var AlbumNameLabel: UILabel!
    @IBOutlet weak var AlbumCountLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgView.layer.borderColor   =   Colors.lightGray.cgColor
        self.imgView.layer.borderWidth   =   0.5
        self.imgView.layer.cornerRadius  =   5.0
        self.imgView.clipsToBounds       =   true
        
        self.AlbumNameLabel.textColor    =   Colors.black
        self.AlbumNameLabel.font         =   Fonts.Normal_16
        self.AlbumNameLabel.lineBreakMode    =   .byTruncatingTail
        self.AlbumNameLabel.numberOfLines    =   2
        
        self.AlbumCountLabel.textColor    =   Colors.lightGray
        self.AlbumCountLabel.font         =   Fonts.Normal_14
        self.AlbumCountLabel.backgroundColor = Colors.clear
        
    }
}
