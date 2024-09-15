//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-11.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeHolder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String){
        Task{
            image = await NetworkManager.shared.downloadImage(from: url) ?? placeholderImage
        }
    }
}
