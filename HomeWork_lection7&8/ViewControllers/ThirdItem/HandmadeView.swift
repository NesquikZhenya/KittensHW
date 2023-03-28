//
//  HandmadeView.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 23.07.2022.
//

import UIKit

class HandmadeView: UIView {
    
    private let headerLabel = UILabel()
    private let welcomeLabel = UILabel()
    private let showCatButton = UIButton()
    private let catImageView = UIImageView()
    private let likeImageView = UIImageView()
    private let likeDescriptionLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviewS()
        preconfigureSubviews()
        configureConstraints()
        configureProperties()
        configureGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewS() {
        addSubview(headerLabel)
        addSubview(welcomeLabel)
        addSubview(showCatButton)
        addSubview(catImageView)
        addSubview(likeImageView)
        addSubview(likeDescriptionLabel)
    }
    
    private func preconfigureSubviews() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureConstraints() {
        configureHeaderLabel()
        configureWelcomeLabel()
        configureShowCatButton()
        configureCatImageView()
        configureLikeImageView()
        configureLikeDescriptionLabel()
    }
    
    private func configureProperties() {
        configureHeaderLabelProperties()
        configureWelcomeLabelProperties()
        configureShowCatButtonProperties()
        configureCatImageViewProperties()
        configureLikeImageViewProperties()
        configureLikeDescriptionLabelProperties()
    }
    
    private func configureGestures() {
        configureCatImageViewGesture()
    }
    
    private func configureHeaderLabel() {
        let topConstraint = NSLayoutConstraint(
            item: headerLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 16
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: headerLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        [topConstraint, leftConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureHeaderLabelProperties() {
        headerLabel.text = "This screen was made entirely in code"
        headerLabel.numberOfLines = 0
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func configureWelcomeLabel() {
        let topConstraint = NSLayoutConstraint(
            item: welcomeLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 16
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: welcomeLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        [topConstraint, leftConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureWelcomeLabelProperties() {
        welcomeLabel.text = "Welcome"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
    
    private func configureShowCatButton() {
        let topConstraint = NSLayoutConstraint(
            item: showCatButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: welcomeLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 24
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: showCatButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        [topConstraint, leftConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureShowCatButtonProperties() {
        showCatButton.backgroundColor = .systemBrown
        showCatButton.setTitle("   Show me the cat   ", for: .normal)
        showCatButton.setTitleColor(.white, for: .normal)
        showCatButton.setTitleColor(.lightGray, for: .highlighted)
        showCatButton.layer.cornerRadius = 8
        showCatButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        showCatButton.addTarget(self, action: #selector(showCatButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func showCatButtonDidTap (_ sender: UIButton) {
        catImageView.isHidden.toggle()
        likeImageView.isHidden.toggle()
        likeDescriptionLabel.isHidden.toggle()
        
        if catImageView.isHidden{
            showCatButton.setTitle("   Show me the cat   ", for: .normal)
        } else {
            showCatButton.setTitle("   Hide the cat   ", for: .normal)
        }
        
    }

    private func configureCatImageView() {
        let topConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: showCatButton,
            attribute: .bottom,
            multiplier: 1,
            constant: 40
        )

        let leftConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 40
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: -40
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: catImageView,
            attribute: .width,
            multiplier: 1,
            constant: 1
        )

        [topConstraint, leftConstraint, rightConstraint, heightConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureCatImageViewProperties() {
        catImageView.image = UIImage(named: "cat5")
        catImageView.isHidden = true
        catImageView.isUserInteractionEnabled = true
    }
    
    private func configureCatImageViewGesture() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleLike))
        doubleTapGesture.numberOfTapsRequired = 2
        catImageView.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc private func toggleLike() {
        if likeImageView.tintColor == .lightGray {
            likeImageView.tintColor = .red
        } else {
            likeImageView.tintColor = .lightGray
        }
    }
    
    private func configureLikeImageView() {
        let topConstraint = NSLayoutConstraint(
            item: likeImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: catImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 8
        )

        let leftConstraint = NSLayoutConstraint(
            item: likeImageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 40
        )

        [topConstraint, leftConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureLikeImageViewProperties() {
        likeImageView.image = UIImage(systemName: "suit.heart.fill")
        likeImageView.isHidden = true
        likeImageView.tintColor = .lightGray
    }
    
    private func configureLikeDescriptionLabel() {
        let topConstraint = NSLayoutConstraint(
            item: likeDescriptionLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: likeImageView,
            attribute: .centerY,
            multiplier: 1,
            constant: 1
        )

        let leftConstraint = NSLayoutConstraint(
            item: likeDescriptionLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: likeImageView,
            attribute: .trailing,
            multiplier: 1,
            constant: 8
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: likeDescriptionLabel,
            attribute: .trailing,
            relatedBy: .greaterThanOrEqual,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: -40
        )

        [topConstraint, leftConstraint, rightConstraint].forEach { constraint in
            constraint.isActive = true
        }
        
    }
    
    private func configureLikeDescriptionLabelProperties() {
        likeDescriptionLabel.isHidden = true
        likeDescriptionLabel.text = "Double tap the kitty to put like :3"
        likeDescriptionLabel.numberOfLines = 0
        likeDescriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        likeDescriptionLabel.textColor = .darkGray
    }
    
}

extension HandmadeView: NameReceiving {
    
    func updateName(name: String) {
        welcomeLabel.text = "Welcome, \(name)"
    }
}
