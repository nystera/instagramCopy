//
//  FeedCell.swift
//  InstagramCopy
//
//  Created by Nathan Yeo on 5/7/21.
//

import UIKit

class FeedCell: UICollectionViewCell {

  // MARK: - Properties
  private let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
  }()

  // Why is it lazy: as it is declaring a target before initialization. If it is LET will need to addTarget under override init
  private lazy var usernameButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitleColor(.black, for: .normal)
    button.setTitle("venom", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
    return button
  }()

  // MARK: - Life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profileImageView.setDimensions(height: 40, width: 40)
    profileImageView.layer.cornerRadius = 40 / 2

    addSubview(usernameButton)
    usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Actions

  @objc func didTapUsername() {
    print("debug tapped username")
  }
}