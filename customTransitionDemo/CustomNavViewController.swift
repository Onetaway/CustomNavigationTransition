//
//  CustomNavViewController.swift
//  customTransitionDemo
//
//  Created by Onet away on 2/6/15.
//  Copyright (c) 2015 Onet away. All rights reserved.
//

import UIKit

class CustomNavViewController: UINavigationController {

    var interactionController: UIPercentDrivenInteractiveTransition?
    var isFromLeft = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        transitioningDelegate = self
        delegate = self
        
        let left = UIScreenEdgePanGestureRecognizer(target: self, action: "handleSwipeFromLeft:")
        left.edges = .Left
        self.view.addGestureRecognizer(left)
        
        let right = UIScreenEdgePanGestureRecognizer(target: self, action: "handleSwipeFromRight:")
        right.edges = .Right
        self.view.addGestureRecognizer(right)
    }

    func handleSwipeFromLeft(gesture: UIScreenEdgePanGestureRecognizer) {
        let percent = gesture.translationInView(gesture.view!).x / gesture.view!.bounds.size.width
        isFromLeft = true
        if gesture.state == .Began {
            interactionController = UIPercentDrivenInteractiveTransition()
            if viewControllers.count > 1 {
                popViewControllerAnimated(true)
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
        } else if gesture.state == .Changed {
            interactionController?.updateInteractiveTransition(percent)
        } else if gesture.state == .Ended {
            if percent > 0.5 {
                interactionController?.finishInteractiveTransition()
            } else {
                interactionController?.cancelInteractiveTransition()
            }
            interactionController = nil
        }
    }
    
    func handleSwipeFromRight(gesture: UIScreenEdgePanGestureRecognizer) {
        let percent = -gesture.translationInView(gesture.view!).x / gesture.view!.bounds.size.width
        isFromLeft = false
        if gesture.state == .Began {
            interactionController = UIPercentDrivenInteractiveTransition()
            if viewControllers.count > 1 {
                popViewControllerAnimated(true)
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
        } else if gesture.state == .Changed {
            interactionController?.updateInteractiveTransition(percent)
        } else if gesture.state == .Ended {
            if percent > 0.5 {
                interactionController?.finishInteractiveTransition()
            } else {
                interactionController?.cancelInteractiveTransition()
            }
            interactionController = nil
        }
    }

}

// MARK: - UINavigationControllerDelegate
extension CustomNavViewController: UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Pop && isFromLeft {
            return LeftPopAnimator()
        }
        
        if operation == .Pop && !isFromLeft {
            return RightPopAnimator()
        }
        
        return nil
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension CustomNavViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RightPopAnimator()
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}















