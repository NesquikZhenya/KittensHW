//
//  MemesHeaderView.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 25.07.2022.
//

import UIKit

class MemesHeaderView: UIView {

    let headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        configureView()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        setupHeaderLabelConstraints()
    }
    
    private func configureView() {
        configureHeaderLabel()
    }
    
    private func setupHeaderLabelConstraints() {
        
        let topConstraint = NSLayoutConstraint(
                item: headerLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1,
                constant: 8
        )
        
        let bottomConstraint = NSLayoutConstraint(
                item: headerLabel,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
        )
        
        let centerXConstraint = NSLayoutConstraint(
                item: headerLabel,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
        )
        
        [topConstraint, bottomConstraint, centerXConstraint].forEach { $0.isActive = true }
    }
    
    private func configureHeaderLabel() {
        headerLabel.text = "KEKW"
        headerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        headerLabel.textColor = .systemBrown
    }
}
