//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-13.
//

import UIKit

class GFRepoItemVC : GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoView1.setItemInfoType(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.setItemInfoType(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}
