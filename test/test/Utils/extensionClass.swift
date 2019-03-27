//
//  GetHtmlDecodedString.swift
//  enterprise
//
//  Created by Preeti on 10/03/19.
//  Copyright © 2019 Preeti. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0,
                   shadowColor  :   UIColor = UIColor.lightGray) {
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = shadowColor.withAlphaComponent(0.4).cgColor
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}

extension String {
    func removeWhitespace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension UITextView {
    func setAttributedTextWithFourValues_textView( text1:String,
                                                   text2:String,
                                                   text3:String,
                                                   text4:String,
                                                   text1Color:UIColor? = Colors.AppTextColor,
                                                   text2Color:UIColor? = Colors.lightGray,
                                                   text3Color:UIColor? = Colors.lightGray,
                                                   text4Color:UIColor? = Colors.lightGray,
                                                   text1Font:UIFont? = Fonts.SemiBold_14,
                                                   text2Font:UIFont? = Fonts.Normal_14,
                                                   text3Font:UIFont? = Fonts.Normal_14,
                                                   text4Font:UIFont? = Fonts.Normal_14) {
        
        let main_string = "\(text1)\(text2)\(text3)\(text4)"
        
        let range1 = (main_string as NSString).range(of: text1)
        let range2 = (main_string as NSString).range(of: text2)
        let range3 = (main_string as NSString).range(of: text3)
        let range4 = (main_string as NSString).range(of: text4)
        
        let attribute = NSMutableAttributedString.init(string: main_string)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: text1Color! , range: range1)
        attribute.addAttribute(NSAttributedString.Key.font, value: text1Font!, range: range1)
        
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: text2Color! , range: range2)
        attribute.addAttribute(NSAttributedString.Key.font, value: text2Font!, range: range2)
        
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: text3Color! , range: range3)
        attribute.addAttribute(NSAttributedString.Key.font, value: text3Font!, range: range3)
        
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: text4Color! , range: range4)
        attribute.addAttribute(NSAttributedString.Key.font, value: text4Font!, range: range4)
        
        self.attributedText = attribute
    }
    
}

extension String {
    var firstCapitalized: String {
        var components = self.components(separatedBy: " ")
        guard let first = components.first else {
            return self
        }
        components[0] = first.capitalized
        return components.joined(separator: " ")
    }
}
