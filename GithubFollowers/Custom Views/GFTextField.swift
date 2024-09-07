//
//  GFTextField.swift
//  GithubFollowers
//
//  Created by Mac on 02/08/24.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {  //storyboard initi
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor // cg for graphics
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true // font shrink when text is big
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground 
        autocorrectionType = .no
        returnKeyType = .go
        
        placeholder = "Enter user name"
    }
    
}


