//
//  ViewController.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class AlbumListVC: UIViewController {

    @IBOutlet weak var AlbumListCollectionView: UICollectionView!
    var AlbumListDictModelObj      :   [AlbumListDictModel]    =   []
    var PhotoListDictModelObj      :   [PhotoListDictModel]    =   []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums List"
        self.getPhotosList()

    }
    
    func getPhotosList() {
        Utils.showCustomisedActivityIndicator((self.view)!, height: 35, width: 35)

        let urlPath = "https://jsonplaceholder.typicode.com/photos"
        let liveInfoUrl = URL(string: urlPath)
        let task = URLSession.shared.dataTask(with: liveInfoUrl! as URL) {data, response, error in
            guard let data = data, error == nil else { return }
            let jsonData = (String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? "")
            
            if let data = jsonData.data(using: String.Encoding.utf8) {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:AnyObject]]
                    let successObj  =   (PhotoListModel(response: jsonResult!))
                    self.PhotoListDictModelObj = successObj.PhotoListDictModelObj
                    self.getAlbumList()

                } catch {
                    print("Something went wrong")
                }
            }
            
        }
        task.resume()
    }
    
    func getAlbumList() {
        
        let urlPath = "https://jsonplaceholder.typicode.com/albums"
        let liveInfoUrl = URL(string: urlPath)
        let task = URLSession.shared.dataTask(with: liveInfoUrl! as URL) {data, response, error in
            guard let data = data, error == nil else { return }
            let jsonData = (String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? "")
            
            if let data = jsonData.data(using: String.Encoding.utf8) {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:AnyObject]]
                    let successObj  =   (AlbumListModel(response: jsonResult!, AlbumPhotoList:self.PhotoListDictModelObj))
                    self.AlbumListDictModelObj = successObj.AlbumListDictModelObj
                    Utils.HideActivityIndicator(self.view)
                    
                    self.AlbumListCollectionView.delegate = self
                    self.AlbumListCollectionView.dataSource = self
                    self.AlbumListCollectionView.reloadData()

                } catch {
                    print("Something went wrong")
                }
            }
        }
        task.resume()
    }
    

}

extension AlbumListVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.AlbumListDictModelObj.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumListCVCell", for: indexPath) as? AlbumListCVCell else { fatalError("Cell not exists in storyboard")}
        
        let modelObj    =   self.AlbumListDictModelObj[indexPath.row]
        let cellSize = collectionView.frame.width/2.1


        cell.AlbumCountLabel.text = "\(modelObj.SubAlbumPhotoList.count) Photos"
        cell.AlbumNameLabel.text = modelObj.album_title
        
        if modelObj.SubAlbumPhotoList[0].photo_thumbnailUrl != "" {
            let url1 = URL(string: "\(modelObj.SubAlbumPhotoList[0].photo_thumbnailUrl)")!
            cell.imgView.sd_setImage(with: url1, placeholderImage: UIImage.init(named: "placeholder-image"))
        }

        cell.imgView.frame         =   CGRect(x: 0, y: 0, width: cellSize, height: cellSize)
        cell.AlbumNameLabel.frame         =   CGRect(x: 5, y: cell.imgView.frame.height+cell.imgView.frame.origin.y+2, width: cellSize-15, height: 40)
        cell.AlbumCountLabel.frame         =   CGRect(x: 5, y: cell.AlbumNameLabel.frame.height+cell.AlbumNameLabel.frame.origin.y-3, width: cellSize-15, height: 25)

        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhotoListVC") as? PhotoListVC
        vc!.SubAlbumPhotoList =  self.AlbumListDictModelObj[indexPath.row].SubAlbumPhotoList
        vc!.albumTitleStr = self.AlbumListDictModelObj[indexPath.row].album_title
        self.navigationController?.pushViewController(vc!, animated: true)
        

        
    }
    
}

extension AlbumListVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = collectionView.frame.width/2.1
        return CGSize(width: cellSize, height: cellSize+72)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
