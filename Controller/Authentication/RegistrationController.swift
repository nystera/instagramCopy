//
//  RegistrationController.swift
//  InstagramCopy
//
//  Created by Nathan Yeo on 10/7/21.
//

import UIKit

class RegistrationController: UIViewController {
  
  // MARK: - Properties
  private let plushPhotoButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
    button.tintColor = .white
    return button
  }()

  private let emailTextField: CustomTextField = {
    let tf = CustomTextField(placeHolder: "Email")
    tf.keyboardType = .emailAddress
    return tf
  }()

  private let passwordTextField: CustomTextField = {
    let tf = CustomTextField(placeHolder: "Password")
    tf.isSecureTextEntry = true
    return tf
  }()

  private let fullnameTextField = CustomTextField(placeHolder: "Fullname")
  private let usernameTextField = CustomTextField(placeHolder: "Username")

  private let signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    button.layer.cornerRadius = 5
    button.setHeight(50)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()

  private let alreadyHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    // Just to practice doing programmatic constraints without using extension
    // Must remember to put translatesAutoResizingMaskIntoConstraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.attributedTitle(normalText: "Already have an account?", boldedText: "Login")
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    return button
  }()



  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }

  // MARK: - Actions
  @objc func handleShowLogin() {
    navigationController?.popViewController(animated: true)
  }

  // MARK: - Helpers
  func configureUI() {
    configureGradientLayer()

    view.addSubview(plushPhotoButton)
    plushPhotoButton.centerX(inView: view)
    plushPhotoButton.setDimensions(height: 140, width: 140)
    plushPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

    let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
    stack.axis = .vertical
    stack.spacing = 20
    view.addSubview(stack)
    stack.anchor(top: plushPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    view.addSubview(alreadyHaveAccountButton)
    // Just to practice doing programmatic constraints without using extension
    alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

  }
}
