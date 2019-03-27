//
//  DissmissAnimator.swift
//  test
//
//  Created by XOXODAYADMIN on 27/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class DissmissAnimator: NSObject {
    
}
extension DissmissAnimator : UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC  =  transitionContext.viewController(forKey: .to)
            else {
                return
        }
        
        let containerView   =   transitionContext.containerView
        
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        let screenBounds    =   UIScreen.main.bounds
        let bottomLeftCorner    =   CGPoint(x: 0, y: screenBounds.height)
        let finalFrame  =   CGRect(origin: bottomLeftCorner, size: screenBounds.size)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.frame   =   finalFrame
        }) { (bool) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
}
