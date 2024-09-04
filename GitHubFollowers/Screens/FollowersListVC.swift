//
//  FollowersListVCViewController.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-03.
//

import UIKit

class FollowersListVC : UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
