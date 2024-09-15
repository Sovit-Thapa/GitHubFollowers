//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-12.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject{
    func didRequestFollowers(for username: String)
}

class UserInfoVC: GFDataLoadingVC{
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView = UIView()
    let itemView1 = UIView()
    let itemView2 = UIView()
    var itemviews: [UIView] = []
    let dataLabel = GFBodyLabel(textAlignment: .center)
    var username : String!
    weak var delegate: UserInfoVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureScrollView()
        layoutUI()
        getUserInfo()
    }
    
    
    func configureVC(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
        
    }
    
    func getUserInfo(){
        Task{
            do{
                let user = try await NetworkManager.shared.getUserInfo(for: username)
                configureUIElements(with: user)
            }
            catch{
                if let gfError = error as? GFError {
                    presentGFAlert(title: "Something went wrong", message: gfError.rawValue, buttonTitle: "Okay")
                }
            }
        }
    }
    
    
    func configureUIElements(with user: User){
        self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemView1)
        self.add(childVC: GFFollowerItemVC(user: user, delegate: self), to: self.itemView2)
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.dataLabel.text = "Github since " + user.createdAt.convertToMonthYearFormat()
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        itemviews = [headerView, itemView1, itemView2, dataLabel]

        for itemView in itemviews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ])
        }

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),

            itemView1.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            itemView1.heightAnchor.constraint(equalToConstant: itemHeight),

            itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: padding),
            itemView2.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dataLabel.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: 18),
            dataLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        childVC.didMove(toParent: self)
    }

    
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}

extension UserInfoVC: GFRepoItemVCDelegate{
    func didTapGithubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlert(title: "Invalid URL", message: "The url is attached to this user is invalid.", buttonTitle: "Okay")
            return
        }
        
       presentSafariVC(with: url)
    }
}

extension UserInfoVC: GFFollowerItemVCDelegate{
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0  else {
            presentGFAlert(title: "No followers", message: "This user has no followers.", buttonTitle: "So Sad")
            return
        }
        
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}


