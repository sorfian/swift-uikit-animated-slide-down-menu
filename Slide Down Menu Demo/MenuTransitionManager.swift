//
//  MenuTransitionManager.swift
//  Slide Down Menu Demo
//
//  Created by Sorfian on 15/04/23.
//

import UIKit

@objc protocol MenuTransitionManagerDelegate {
    func dismiss()
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    var isPresenting = false
    var snapshot: UIView? {
        didSet{
            if let delegate = delegate {
                let tapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: #selector(delegate.dismiss))
                snapshot?.addGestureRecognizer(tapGestureRecognizer)
                
            }
        }
    }
    
    var delegate: MenuTransitionManagerDelegate?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let container = transitionContext.containerView
        
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        let moveDown = CGAffineTransform(translationX: 0, y: container.frame.height - 150)
        
        if isPresenting {
            toView.transform = moveUp
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView)
            container.addSubview(snapshot!)
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, animations: {
            
            if self.isPresenting {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransform.identity
            } else {
                self.snapshot?.transform = CGAffineTransform.identity
                fromView.transform = moveUp
            }
                
            
        }) { finished in
            transitionContext.completeTransition(true)
            
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}
