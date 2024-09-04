//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-03.
//

import UIKit

extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async{
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
