//
//  GFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-13.
//

import UIKit

class GFFollowerItemVC : GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoView1.setItemInfoType(itemInfoType: .followers, withCount: user.followers)
        itemInfoView2.setItemInfoType(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
