//
//  PhotoDetailCVCell.swift
//  test
//
//  Created by XOXODAYADMIN on 27/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class PhotoDetailCVCell: UICollectionViewCell {
    
    let scrollView = UIScrollView()
    let upperEmptyView = UIView()
    let imageView = UIImageView()
    let lowerEmptyView = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.frame = contentView.bounds
        
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 0.5

        imageView.frame = scrollView.bounds
        imageView.contentMode =  .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        upperEmptyView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: imageView.frame.origin.y)
        lowerEmptyView.frame = CGRect(x: 0, y: imageView.frame.maxY, width: scrollView.frame.width, height: scrollView.frame.height-imageView.frame.maxY)
        
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTapGestureRecognizer)
        
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = imageView.frame.size
        imageView.center = scrollView.center
        scrollView.delegate = self as! UIScrollViewDelegate
        
        activityIndicator.frame = CGRect(x: (scrollView.frame.width-10)/2, y: (scrollView.frame.height-10)/2, width: 10, height: 10)
        activityIndicator.startAnimating()
        
        contentView.addSubview(activityIndicator)
        
        contentView.addSubview(scrollView)
        
    }
    
    @objc func doubleTap() {
        if scrollView.zoomScale <= 2 {
            setZoomLevelWithAnimation(zoomScale: scrollView.zoomScale+1)
        }else{
            setZoomLevelWithAnimation(zoomScale: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(imageID:String, imageObj:UIImage = #imageLiteral(resourceName: "placeholder-image") )  {
        activityIndicator.startAnimating()
        imageView.isHidden = true
        
        if imageObj !=  #imageLiteral(resourceName: "placeholder-image") {
            self.updateFrames(image: imageObj)
            self.activityIndicator.stopAnimating()
            return
        }
        
        imageView.sd_setImage(with: URL(string: "\(imageID)")!) { (image, error, imageCacheType, imageUrl) in
            if image != nil {
                print("image found")
                self.updateFrames(image: image!)
                self.activityIndicator.stopAnimating()
            }
        }

    }
    
    
    func updateFrames(image:UIImage) {
        self.imageView.image = image
        self.imageView.isHidden = false
//        imageView.frame = CGRect(x: 0, y: (scrollView.frame.height-image.size.height)/2, width: scrollView.frame.width, height: image.size.height)
//        upperEmptyView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: imageView.frame.origin.y)
//        lowerEmptyView.frame = CGRect(x: 0, y: imageView.frame.maxY, width: scrollView.frame.width, height: scrollView.frame.height-imageView.frame.maxY)
//        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: lowerEmptyView.frame.maxY)
    }
    
    func setZoomLevelWithAnimation(zoomScale:CGFloat) {
        
        UIView.animate(withDuration: 0.2) {
            self.scrollView.zoomScale = zoomScale
        }
        
    }
    
}

extension PhotoDetailCVCell:UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
        
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
        if scale < 1 {
            
            setZoomLevelWithAnimation(zoomScale: 1)
            
        }
        
    }
    
}
