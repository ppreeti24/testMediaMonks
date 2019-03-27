//
//  AlbumListModel.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class PhotoListModel: NSObject {
    var isError                 :   Int                     =   0
    var msgForError             :   String                  =   ""
    var PhotoListDictModelObj   :   [PhotoListDictModel]    =   []
   // var AlbumListDictModelObj   :   [AlbumListDictModel]    =   []

    
    override init() {
        super.init()
    }
    init(response:[[String:AnyObject]]) {
        for item in response{
            let modelObj =   PhotoListDictModel(itemDict: item)
            
            self.PhotoListDictModelObj.append(modelObj)
        }

    }
}


class PhotoListDictModel :  NSObject {
    var photo_albumId           :   Int      =   0
    var photo_id                :   Int      =   0
    var photo_title             :   String      =   ""
    var photo_url               :   String      =   ""
    var photo_thumbnailUrl      :   String      =   ""
    
    init(itemDict:[String:AnyObject]) {
        self.photo_albumId       =   ((itemDict["albumId"] as? Int) ?? 0) as Int
        self.photo_id            =   (((itemDict["id"] as? Int) ?? 0) as Int)
        self.photo_title         =   (((itemDict["title"] as? String) ?? "") as String).firstCapitalized
        self.photo_url           =   ((itemDict["url"] as? String) ?? "") as String
        self.photo_thumbnailUrl  =   ((itemDict["thumbnailUrl"] as? String) ?? "") as String
        
    }
}
