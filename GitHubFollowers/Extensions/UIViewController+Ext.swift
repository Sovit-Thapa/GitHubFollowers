//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-03.
//

import UIKit
import SafariServices

extension UIViewController{
    
    func presentGFAlert(title: String, message: String, buttonTitle: String){
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
    }
    
    func presentDefaultError(){
            let alertVC = GFAlertVC(alertTitle: "Something went wrong", message: "We were unable to complete your request. Please try again", buttonTitle: "Okay")
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url : URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
   
}
