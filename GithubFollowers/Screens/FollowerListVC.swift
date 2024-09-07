//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by Mac on 02/08/24.
//

import UIKit

class FollowerListVC: UIViewController {

    var userName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
