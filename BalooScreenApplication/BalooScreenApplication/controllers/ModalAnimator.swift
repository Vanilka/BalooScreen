//
//  ModalAnimator.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 14/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ModalAnimator: NSObject, NSViewControllerPresentationAnimator {

    
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        //
        let contentView = fromViewController.view
        
    }

    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        //
    }
}
