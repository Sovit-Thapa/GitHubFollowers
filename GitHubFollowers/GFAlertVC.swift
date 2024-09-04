//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-03.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let alertButton = GFButton(backgroundColor: .systemRed, title: "Okay")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureAlertButton()
        configureBodyLabel()
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 250),
            containerView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong !!"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureAlertButton(){
        containerView.addSubview(alertButton)
        alertButton.setTitle(buttonTitle ?? "OK", for: .normal)
        alertButton.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            alertButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            alertButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureBodyLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to recieve request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: alertButton.topAnchor, constant: -8),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
        ])
    }
    
    @objc func dissmissVC(){
        dismiss(animated: true)
    }
}
