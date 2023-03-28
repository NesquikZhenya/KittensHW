//
//  CustomTableViewCell.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 24.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    let addCatImageView = UIImageView()
    let catImageView = UIImageView()
    
    weak var delegate: CheckUpdatable?
    var cellSectionIndex: Int = 0
    var cellIndex: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMemeInfo(meme: MemeInfo) {
        nameLabel.text = meme.name
        catImageView.image = UIImage(named: meme.image)
        if meme.download {
            addCatImageView.image = UIImage(named: "filledCheck")
        } else {
            addCatImageView.image = UIImage(named: "emptyCheck")

        }
    }
    
    private func addSubviews() {
        [nameLabel, addCatImageView, catImageView].forEach { subview in
            contentView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        setupNameLabelConstraints()
        setupAddCatImageViewConstraints()
        setupCatImageViewConstraints()
    }
    
    private func configureViews() {
        configureNameLabel()
        configureAddCatImageView()
        configureCatImageView()
    }
    
    private func setupNameLabelConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 16
        )
        
        let leadingConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1,
            constant: 80
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .trailing,
            relatedBy: .greaterThanOrEqual,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1,
            constant: 40
        )
        
        [topConstraint, leadingConstraint, trailingConstraint].forEach { $0.isActive = true }
    }
    
    private func configureNameLabel() {
        nameLabel.text = "Kitty"
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    private func setupAddCatImageViewConstraints() {
        
        let leadingConstraint = NSLayoutConstraint(
            item: addCatImageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1,
            constant: 16
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: addCatImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 40
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: addCatImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 40
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: addCatImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: catImageView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        
        [leadingConstraint, heightConstraint, widthConstraint, centerYConstraint].forEach { $0.isActive = true }
    }
    
    private func configureAddCatImageView() {
        addCatImageView.image = UIImage(named: "filledCheck")
        addCatImageView.isUserInteractionEnabled = true
        addCatImageView.contentMode = .scaleToFill
        let addCatGesture = UITapGestureRecognizer(target: self, action: #selector(addCatTapped))
        addCatImageView.addGestureRecognizer(addCatGesture)
    }
    
    @objc private func addCatTapped() {
        delegate?.updateCheck(cellSectionIndex: cellSectionIndex, cellIndex: cellIndex)
    }
    
    private func setupCatImageViewConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: nameLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 8)
        
        let leadingConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: addCatImageView,
            attribute: .trailing,
            multiplier: 1,
            constant: 16)
        
        let trailingConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1,
            constant: -16)
        
        let bottomConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: 0)
        
        let heightConstraint = NSLayoutConstraint(
            item: catImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 80)
        
        [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint, heightConstraint].forEach { $0.isActive = true }
    }
    
    private func configureCatImageView() {
        catImageView.image = UIImage(named: "cat5")
    }

}
