//
//  MenuHeader.swift
//  Uber-Clone
//
//  Created by Daulet Ashikbayev on 30.07.2022.
//

import UIKit

protocol MenuHeaderDelegate: AnyObject {
    func changePickupMode()
}

class MenuHeader: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MenuHeaderDelegate?
    
    private let user: User
    
    private lazy var profileImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        view.addSubview(initialLabel)
        initialLabel.centerX(inView: view)
        initialLabel.centerY(inView: view)
        
        return view
    }()
    
    private lazy var initialLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42)
        label.textColor = .white
        label.text = user.firstInitial
        return label
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = user.fullName
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "test@gmail.com"
        label.text = user.email
        return label
    }()
    
    let pickupModeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 1.0, alpha: 0.9)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var pickupModeSwitch: UISwitch = {
        let s = UISwitch()
        s.isOn = true
        s.tintColor = .white
        s.onTintColor = .mainBlueTint
        s.addTarget(self, action: #selector(handlePickupModeChanged), for: .valueChanged)
        return s
    }()
    
    // MARK: - Lifecycle
    
    init(user: User, frame: CGRect) {
        self.user = user
        super.init(frame: frame)
        
        backgroundColor = .backgroundColor
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 4, paddingLeft: 12,
                                width: 64, height: 64)
        profileImageView.layer.cornerRadius = 64 / 2
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, emailLabel])
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .vertical
        
        addSubview(stack)
        stack.centerY(inView: profileImageView,
                      leftAnchor: profileImageView.rightAnchor,
                      paddingLeft: 12)
        
        configureSwitch(enabled: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handlePickupModeChanged() {
        delegate?.changePickupMode()
    }
    
    // MARK: - Helper Functions
    
    func configureSwitch(enabled: Bool) {
        if user.accountType == .driver {
            addSubview(pickupModeLabel)
            pickupModeLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
            
            addSubview(pickupModeSwitch)
            pickupModeSwitch.anchor(top: pickupModeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 16)
            
            pickupModeSwitch.isOn = enabled
            pickupModeLabel.text = enabled ? "PICKUP MODE ENABLED" : "PICKUP MODE DISABLED"
        }
    }
}
