//
//  AlbumListModel.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class AlbumListModel: NSObject {
    
    var isError                :   Int                     =   0
    var msgForError            :   String                  =   ""
    var AlbumListDictModelObj  :   [AlbumListDictModel]    =   []
   // var AlbumPhotoList   :   [PhotoListDictModel]    =   []


    override init() {
        super.init()
    }
    init(response:[[String:AnyObject]], AlbumPhotoList:[PhotoListDictModel]) {
            for item in response{
                let modelObj =   AlbumListDictModel(itemDict: item, AlbumPhotoList: AlbumPhotoList)
                self.AlbumListDictModelObj.append(modelObj)
            }
    }
}


class AlbumListDictModel :  NSObject {
    var album_userId      :   Int      =   0
    var album_id          :   Int      =   0
    var album_title       :   String      =   ""
    
    var SubAlbumPhotoList   :   [PhotoListDictModel]    =   []

    init(itemDict:[String:AnyObject], AlbumPhotoList:[PhotoListDictModel]) {
        self.album_userId      =   ((itemDict["userId"] as? Int) ?? 0) as Int
        self.album_id          =   (((itemDict["id"] as? Int) ?? 0) as Int)
        self.album_title       =   (((itemDict["title"] as? String) ?? "") as String).firstCapitalized
     
        for itemPhoto in AlbumPhotoList{
            if album_id == itemPhoto.photo_albumId{
                self.SubAlbumPhotoList.append(itemPhoto)
            }
        }
        print("SubAlbumPhotoList.count...\(SubAlbumPhotoList.count)")

    }
}
