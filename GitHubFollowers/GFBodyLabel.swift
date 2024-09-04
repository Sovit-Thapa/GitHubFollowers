//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-03.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configureLabel()
    }
    
    private func configureLabel(){
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
