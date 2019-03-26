//
//  Colors.swift
//  TestManufacturingFirm
//
//  Created by Preeti on 10/03/19.
//  Copyright © 2019 Preeti. All rights reserved.
//

import UIKit

open class Colors {
    static let clear        =      UIColor.clear
    static let white        =      UIColor.white
    static let black        =      UIColor.black
    static let lightGray    =      UIColor.lightGray
    static let blue         =      UIColor.blue
    static let gray         =      UIColor.gray
    static let darkGray     =      UIColor.darkGray
    static let green        =      UIColor.green
    static let red          =      UIColor.red
    static let cyan         =      UIColor.cyan
    static let purple       =      UIColor.purple
    static let groupTableViewBackground       =      UIColor.groupTableViewBackground


    static  var PrimaryColor        =   UIColor(red: 20/255, green: 120/255, blue: 246/255, alpha: 1)
    static  let AppBackgrondColor   =   UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
    static  let AppSecondaryColor   =   UIColor(red: 54/255, green: 142/255, blue: 205/255, alpha: 1)
    static  let logoBackGroundColor =   UIColor(red: 238/255, green: 67/255, blue: 37/255, alpha: 1)
    static  let AppTextColor        =   UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
    static  let AppGreenColor       =   UIColor(red: 0/255, green: 44/255, blue: 94/255, alpha: 1)
    static  let extremeLightGray    =   UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    static  let transparentColor    =   UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1)
    static  let AppGrayBlue         =   UIColor(red: 245/255, green: 246/255, blue: 248/255, alpha: 1)
    static  let AppOnlineGreen      =   UIColor(red: 102/255, green: 204/255, blue: 0/255, alpha: 1)
    static  let AppImageGray        =   UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
    static  let AppBadgeBack        =   UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    static  let AppDownFont         =   UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
    static  let defauldNavBarColor  =   UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1) //F7F7F7

    static let searchBarBackgroundColor =    UIColor(red: 224/255, green: 224/255, blue: 225/255, alpha: 1)
    static let navigationBarBackgroundColor =    UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
    static let notificationsDurationColor =    UIColor(red: 20/255, green: 94/255, blue: 244/255, alpha: 1)
    static let baseBackgroundColor        =    UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
    static let separatorDefaultColor       =    UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
    static let postToolbarItemTintColor       =    UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
    
    static let darkGrayishShade     =    UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)

    static  let tagBackColor =   UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    static  let AppOrangeColor  =  UIColor(red: 241/255, green: 92/255, blue: 34/255, alpha: 1)//#f15c22

}

open class Fonts {
    //Normal
    static  let Normal_2    =   UIFont.systemFont(ofSize:2)
    static  let Normal_3    =   UIFont.systemFont(ofSize:3)
    static  let Normal_6    =   UIFont.systemFont(ofSize:6)
    static  let Normal_7    =   UIFont.systemFont(ofSize:7)

    static  let Normal_8    =   UIFont.systemFont(ofSize:8)
    static  let Normal_9    =   UIFont.systemFont(ofSize:9)
    static  let Normal_10    =  UIFont.systemFont(ofSize:10)
    static  let Normal_11   =   UIFont.systemFont(ofSize:11)
    static  let Normal_12   =   UIFont.systemFont(ofSize:12)
    static  let Normal_13   =   UIFont.systemFont(ofSize:13)
    static  let Normal_14   =   UIFont.systemFont(ofSize:14)
    static  let Normal_15   =   UIFont.systemFont(ofSize:15)
    static  let Normal_16   =   UIFont.systemFont(ofSize:16)
    static  let Normal_17   =   UIFont.systemFont(ofSize:17)
    static  let Normal_18   =   UIFont.systemFont(ofSize:18)
    static  let Normal_19   =   UIFont.systemFont(ofSize:19)
    static  let Normal_25   =   UIFont.systemFont(ofSize:25)
    static  let Normal_30   =   UIFont.systemFont(ofSize:30)

    //Bold
    static let Bold_3       =   UIFont.boldSystemFont(ofSize:3)
    static let Bold_9       =   UIFont.boldSystemFont(ofSize:9)
    static let Bold_11      =   UIFont.boldSystemFont(ofSize:11)
    static let Bold_12      =   UIFont.boldSystemFont(ofSize:12)
    static let Bold_13      =   UIFont.boldSystemFont(ofSize:13)
    static let Bold_14      =   UIFont.boldSystemFont(ofSize:14)
    static let Bold_15      =   UIFont.boldSystemFont(ofSize:15)
    static let Bold_17      =   UIFont.boldSystemFont(ofSize:17)
    static let Bold_18      =   UIFont.boldSystemFont(ofSize:18)
    static let Bold_20      =   UIFont.boldSystemFont(ofSize:20)
    static let Bold_21      =   UIFont.boldSystemFont(ofSize:21)
    static let Bold_22      =   UIFont.boldSystemFont(ofSize:22)
    static let Bold_24      =   UIFont.boldSystemFont(ofSize:24)
    static let Bold_50      =   UIFont.boldSystemFont(ofSize:50)
    
    //SemiBold
    static let SemiBold_3       =   UIFont.systemFont(ofSize: 3, weight: .semibold)
    static let SemiBold_9       =   UIFont.systemFont(ofSize: 9, weight: .semibold)
    static let SemiBold_10      =   UIFont.systemFont(ofSize: 10, weight: .semibold)
    static let SemiBold_11      =   UIFont.systemFont(ofSize: 11, weight: .semibold)
    static let SemiBold_12      =   UIFont.systemFont(ofSize: 12, weight: .semibold)
    static let SemiBold_13      =   UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let SemiBold_14      =   UIFont.systemFont(ofSize: 14, weight: .semibold)
    static let SemiBold_15      =   UIFont.systemFont(ofSize: 15, weight: .semibold)
    static let SemiBold_16      =   UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let SemiBold_17      =   UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let SemiBold_19      =   UIFont.systemFont(ofSize: 19, weight: .semibold)
    
    //Italics
    static let Italics_3       =   UIFont.italicSystemFont(ofSize:3)
    static let Italics_9       =   UIFont.italicSystemFont(ofSize:9)
    static let Italics_11      =   UIFont.italicSystemFont(ofSize:11)
    static let Italics_12      =   UIFont.italicSystemFont(ofSize:12)
    static let Italics_13      =   UIFont.italicSystemFont(ofSize:13)
    static let Italics_14      =   UIFont.italicSystemFont(ofSize:14)
    static let Italics_15      =   UIFont.italicSystemFont(ofSize:15)
    static let Italics_17      =   UIFont.italicSystemFont(ofSize:17)
        
    // Medium
    static  let Medium_11   =   UIFont.systemFont(ofSize: 11, weight: .medium)
    static  let Medium_12   =   UIFont.systemFont(ofSize: 12, weight: .medium)
    static  let Medium_13   =   UIFont.systemFont(ofSize: 13, weight: .medium)
    static  let Medium_14   =   UIFont.systemFont(ofSize: 14, weight: .medium)
    static  let Medium_15   =   UIFont.systemFont(ofSize: 15, weight: .medium)
    static  let Medium_16   =   UIFont.systemFont(ofSize: 16, weight: .medium)
    static  let Medium_17   =   UIFont.systemFont(ofSize: 17, weight: .medium)
   
    
}



