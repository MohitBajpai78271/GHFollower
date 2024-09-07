//
//  UIViewControllerEXT.swift
//  GithubFollowers
//
//  Created by Mac on 02/08/24.
//

import UIKit

fileprivate var containerView : UIView!

extension UIViewController{
    
    func presentCustomAlertOnMainThread(title: String,message: String,buttonTitle: String){
        DispatchQueue.main.async{
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve //fade in
            self.present(alertVC,animated: true)
        }
    }
    
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)//gives size
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async{  // all ui updates in main thread
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message : String,in view: UIView){
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
