//
//  ZoomingIconTransition.swift
//  ZoomingIcons
//
//  Created by Auston Salvana on 8/6/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

class ZoomingIconTransition: NSObject, UIViewControllerAnimatedTransitioning,UINavigationControllerDelegate {
    
    let kZoomingIconTransitionDuration: NSTimeInterval = 1
    var containerView: UIView?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return kZoomingIconTransitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//    create a NSTimeInterval constant and set it to the output of transitionDuration(transitionContext)
//        create an UIViewController object called fromViewController. Set it to the NSString constant UITransitionContextFromViewControllerKey for the transitionContext’s viewControllerForKey property.
//        create an UIViewController object called toViewController. Set it to the NSString constant UITransitionContextToViewControllerKey for the transitionContext’s viewControllerForKey property.
//        create an UIView called containerView.
        
        let output: NSTimeInterval = transitionDuration(transitionContext)
        let fromViewController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        let toViewController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        containerView = transitionContext.containerView()
        containerView?.clipsToBounds = true
        containerView!.addSubview(fromViewController.view)
        containerView!.addSubview(toViewController.view)
        containerView?.userInteractionEnabled = true
        toViewController.view.alpha = 0
    
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            toViewController.view.alpha = 1
        }) { (Bool) -> Void in
            transitionContext.completeTransition(true)
        }

    }
    
    func navigationController(navigationController: UINavigationController,
        animationControllerForOperation operation: UINavigationControllerOperation,
        fromViewController fromVC: UIViewController,
        toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return self
    }
}
