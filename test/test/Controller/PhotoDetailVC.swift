//
//  PhotoDetailVC.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class PhotoDetailVC: UIViewController , UIGestureRecognizerDelegate{
    
    fileprivate var collectionView:UICollectionView?
    
    fileprivate let cellReuseIdentifier = "PhotoDetailCVCell"
    
    fileprivate var pictures:[String]  = []
    fileprivate var photosTitles:[String]  = []

    var imageObj1 : UIImage  = UIImage()
    
    fileprivate let pageSelectionLabel = UILabel()
    fileprivate let titleLabel = UILabel()

    var interactor:InteractorForVC?
    var selectedIndex: Int  = 0
    var buttonSize: Int  = 45
    var buttonY: Int  = 0

    init(pictures:[String], photosTitles:[String], imageObj:UIImage = #imageLiteral(resourceName: "placeholder-image")) {
        self.pictures  = pictures
        imageObj1 = imageObj
        self.photosTitles = photosTitles
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    var closeStatus : Bool = false
    
    @objc private func closeVC()  {
        if closeStatus == false{
            closeStatus = true
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    var iPhoneHasTopNotch: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.black
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        buttonSize = Utils.iPhoneIsXSeries ? 70 : 45
        buttonY = Utils.iPhoneIsXSeries ? 25 : 0

        // collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(x:0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView!.register(PhotoDetailCVCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView?.isPagingEnabled = true
        collectionView!.bounces = false
        view.addSubview(collectionView!)
        
        let closeButton = UIButton(frame: CGRect(x: 0, y: buttonY, width: buttonSize, height: buttonSize ))
        closeButton.setImage( #imageLiteral(resourceName: "Back").withRenderingMode(.alwaysTemplate) , for: .normal)
        closeButton.tintColor = UIColor.white
        closeButton.backgroundColor = Colors.black.withAlphaComponent(0.1)
        closeButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        view.addSubview(closeButton)
        
        titleLabel.frame = CGRect(x: CGFloat(buttonSize), y: CGFloat(buttonY), width: view.frame.width-CGFloat(buttonSize), height: CGFloat(buttonSize))
        view.addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.textAlignment  = .center
        titleLabel.backgroundColor = Colors.black.withAlphaComponent(0.1)
        titleLabel.textColor = Colors.white
        titleLabel.textAlignment = .left
        titleLabel.font = Fonts.Normal_14
        titleLabel.text = photosTitles[selectedIndex]
        
        pageSelectionLabel.frame = CGRect(x: 0, y: view.frame.height-35, width: view.frame.width, height: 35)
        view.addSubview(pageSelectionLabel)
        
        //show label
        if pictures.count > 1{
            pageSelectionLabel.text = "   \(selectedIndex+1)/\(pictures.count) Photos"
            pageSelectionLabel.backgroundColor = Colors.clear
        }
        pageSelectionLabel.backgroundColor = Colors.black
        pageSelectionLabel.textColor = Colors.white
        pageSelectionLabel.textAlignment = .left
        pageSelectionLabel.font = Fonts.SemiBold_14
        
        let panRecognizer   = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        self.view.addGestureRecognizer(panRecognizer)
        
        self.collectionView!.scrollToItem(at: IndexPath(item: selectedIndex , section: 0), at: .centeredHorizontally, animated: true)
        self.collectionView!.layoutSubviews()
        
    }
    
    
    
    @objc private func handlePan(recognizer:UIPanGestureRecognizer)  {
        
        let percentThreshHold:CGFloat   =   0.3
        let translation = recognizer.translation(in: self.view)
        let verticalMovement    =   translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor    =   interactor else { return }
        switch recognizer.state {
        case .began:
            interactor.hasStarted   =   true
            closeVC()
        case .changed:
            interactor.shouldFinish =   progress > percentThreshHold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted   =   false
            interactor.cancel()
        case .ended:
            interactor.hasStarted   =   false
            interactor.shouldFinish ? interactor.finish() : interactor.cancel()
        default:
            break
        }
        
    }
    
}

extension PhotoDetailVC : UICollectionViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionView!.contentOffset, size: collectionView!.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = collectionView!.indexPathForItem(at: visiblePoint)
        
        selectedIndex = indexPath!.row
        pageSelectionLabel.text = "   \(indexPath!.row+1)/\(pictures.count) Photos"
        titleLabel.text = photosTitles[indexPath!.row]

    }
    
}


extension PhotoDetailVC : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PhotoDetailCVCell
        let imageId = pictures[indexPath.row]
        cell.setData(imageID: imageId, imageObj:imageObj1)
        
        return cell
    }
}





