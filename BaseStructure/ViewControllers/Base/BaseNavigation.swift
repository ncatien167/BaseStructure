//
//  BaseNavigation.swift
//  CuuHo
//
//  Created by Tien on 6/18/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func makeNavigationBarTransparent() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    func resetNavigationBar() {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil
        self.navigationBar.isTranslucent = false
    }
    
}

class BaseNavigation: UINavigationController {

    enum  NavigationTransitionStyle {
        case sideBySide
    }
    
    // MARK: Properties
    
    private var transitionStyle: NavigationTransitionStyle?
    
    // MARK: init nibName
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        transitionStyle = .sideBySide
        super.init(coder: aDecoder)
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        self.makeNavigationBarTransparent()
    }

}

// MARK: Navigation Controller Delegate

extension BaseNavigation: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return pushOperationTransitionAnimator(for: toVC)
        default:
            //
            return nil
        }
    }
    
    private func pushOperationTransitionAnimator(for vc: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard  let style = transitionStyle else { return nil }
        switch style {
        case .sideBySide:
            return nil
        }
    }
    
    private func defaultAnimator(for vc: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //
        return nil
    }
    
}


