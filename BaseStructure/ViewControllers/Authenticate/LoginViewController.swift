//
//  LoginViewController.swift
//  CuuHo
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import UIKit
import AccountKit

class LoginViewController: UIViewController, AKFViewControllerDelegate {
    
    var _accountKit: AKFAccountKit!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if _accountKit == nil {
//            _accountKit = AKFAccountKit(responseType: .accessToken)
//        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if _accountKit?.currentAccessToken != nil {
            print(_accountKit?.currentAccessToken)
            
        }
        else {
            // Show the login screen
        }
    }
    
    func loginWithPhone(){
        let inputState = UUID().uuidString
        let vc = (_accountKit?.viewControllerForPhoneLogin(with: nil, state: inputState))!
        vc.enableSendToFacebook = true
        self.prepareLoginViewController(loginViewController: vc)
        self.present(vc as UIViewController, animated: true, completion: nil)
    }
    
    // Mark: Action
    @IBAction func ontapLogin(sender: UIButton) {
//        loginWithPhone()
        UIApplication.tryURL(urls: [
            "fb://profile/100006545556823", // App
            "fb://profile/100006545556823" // Website if app fails
            ])
    }
    
}

extension LoginViewController {
    
    func prepareLoginViewController(loginViewController: AKFViewController) {
        loginViewController.delegate = self
        //UI Theming - Optional
        loginViewController.uiManager = AKFSkinManager(skinType: .classic, primaryColor: UIColor.blue)
    }
    
    func viewController(viewController: UIViewController!, didCompleteLoginWithAccessToken accessToken: AKFAccessToken!, state: String!) {
        print("did complete login with access token \(accessToken.tokenString) state \(state)")
    }
    
    func viewController(_ viewController: (UIViewController & AKFViewController)!, didCompleteLoginWithAuthorizationCode code: String!, state: String!) {
        print(code)
    }
    
    func viewController(_ viewController: (UIViewController & AKFViewController)!, didFailWithError error: Error!) {
        print(viewController)
        print(error.localizedDescription)
    }
    
}


extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(NSURL(string: url)! as URL) {
                application.openURL(NSURL(string: url)! as URL)
                return
            }
        }
    }
}
