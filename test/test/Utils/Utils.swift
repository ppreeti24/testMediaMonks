//
//  Utils.swift
//  TestManufacturingFirm
//
//  Created by Preeti on 10/03/19.
//  Copyright © 2019 Preeti. All rights reserved.
//

import UIKit

class Utils: NSObject {
    //MARK: calcualte required height and width for UITextView
    public  static func requiredHeightForTextView(text : String, font : UIFont, width : CGFloat) -> CGFloat
    {
        let txtView:UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        txtView.font = font
        txtView.text = text
        txtView.sizeToFit()
        return txtView.frame.height
    }
    public  static func requiredWidthForTextView(text:String, font:UIFont, height:CGFloat) -> CGFloat
    {
        let txtView:UITextView = UITextView(frame: CGRect(x:0, y: 0, width:CGFloat.greatestFiniteMagnitude, height: height))
        txtView.font = font
        txtView.text = text
        txtView.sizeToFit()
        return txtView.frame.width
    }

    
    //MARK: Customised_Activity_Indicator
    public static  var loadingView: UIView = UIView()
    public static  var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    public  static  func showCustomisedActivityIndicator(_ uiView:  UIView, height: CGFloat,    width:  CGFloat)
    {
        loadingView.frame = CGRect(x: 0, y: 0, width: width*2, height: height*2)
        loadingView.center =  CGPoint(x: uiView.frame.size.width / 2,
                                      y: uiView.frame.size.height / 2)
        loadingView.backgroundColor = UIColor.clear
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: width, height: height);
        actInd.style = UIActivityIndicatorView.Style.gray
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2,
                                y: loadingView.frame.size.height / 2)
        loadingView.addSubview(actInd)
        uiView.addSubview(loadingView)
        actInd.startAnimating()
    }
        
    public static  func HideActivityIndicator(_ uiView: UIView) {

        if actInd.isDescendant(of: uiView) {
            actInd.stopAnimating()
            loadingView.removeFromSuperview()
        }else{
                print("Activity indicator not found on the view to be stopped")
            }
    }
    
    public static var iPhoneIsXSeries: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }

}
class InteractorForVC: UIPercentDrivenInteractiveTransition {
    
    var hasStarted  =   false
    var shouldFinish    =   false
    
}
