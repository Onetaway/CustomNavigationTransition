//
//  PopAnimator.swift
//  customTransitionDemo
//
//  Created by Onet away on 2/6/15.
//  Copyright (c) 2015 Onet away. All rights reserved.
//

import UIKit


class RightPopAnimator: NSObject {
   
}

extension RightPopAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(context: UIViewControllerContextTransitioning) {
        let toView = context.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        let fromView = context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
        
        context.containerView().insertSubview(toView!, belowSubview: fromView!)
        
        UIView.animateWithDuration(transitionDuration(context), animations: {
            let finalCenterX = (fromView?.center.x)! - (fromView?.bounds.size.width)!
            let finalCenterY = (fromView?.center.y)!
            fromView?.center = CGPoint(x: finalCenterX, y: finalCenterY)
            return
            }, completion: { finished in
                context.completeTransition(!context.transitionWasCancelled())
        })
    }
}
