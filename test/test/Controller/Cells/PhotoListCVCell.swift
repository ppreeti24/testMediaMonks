//
//  AlbumListCVCell.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class PhotoListCVCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgView.layer.borderColor   =   Colors.lightGray.cgColor
        self.imgView.layer.borderWidth   =   0.5
        self.imgView.layer.cornerRadius  =   5.0
        self.imgView.clipsToBounds       =   true
    }

}
