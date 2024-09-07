//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Mac on 02/08/24.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(fontSize: 20, textAlignment: .center)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let okButton = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle : String?
    var message : String?
    var buttonTitle : String?
    
    let padding : CGFloat = 20
    
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
        configureButton()
        configureMessageLabel()
        
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureTitleLabel(){
        
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureButton(){
        containerView.addSubview(okButton)
        okButton.setTitle(buttonTitle, for: .normal)
        okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            okButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            okButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            okButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func dismissAlert(){
        dismiss(animated: true)
    }
    
    func configureMessageLabel(){
        view.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo : containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -12)
        ])
    }
}
