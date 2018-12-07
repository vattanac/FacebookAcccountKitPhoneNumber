//
//  ViewController.swift
//  FacebookAccountkit
//
//  Created by Vattanac on 12/7/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit
import AccountKit
class ViewController: UIViewController , AKFViewControllerDelegate{
    var accountKit : AKFAccountKit!
    @IBAction func Click(_ sender: Any) {
        
        accountKit = AKFAccountKit(responseType: .accessToken)
        let vc = accountKit.viewControllerForPhoneLogin()
        vc.enableSendToFacebook = true
        vc.delegate  = self
        vc.defaultCountryCode = "kh"
        present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func viewController(_ viewController: (UIViewController & AKFViewController)!, didCompleteLoginWith accessToken: AKFAccessToken!, state: String!) {
        accountKit.requestAccount { (account, error) in
            let phone = account?.phoneNumber?.stringRepresentation()
            
            print(phone!)
        }
    }

}

