//
//  GFTabBarController.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-13.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchVC(), createFavouritesNC()]
    }
    
    func createSearchVC() ->UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavouritesNC() ->UINavigationController{
        let favouriteVC = FavouriteListVC()
        favouriteVC.title = "Favourites"
        favouriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouriteVC)
    }
}
