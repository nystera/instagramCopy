//
//  LoginController.swift
//  InstagramCopy
//
//  Created by Nathan Yeo on 10/7/21.
//

import UIKit

class LoginController: UIViewController {
  // MARK: - Properties

  private var viewModel = LoginViewModel()

  private let iconImage: UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
    iv.contentMode = .scaleAspectFill
    return iv
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

  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log in", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    button.layer.cornerRadius = 5
    button.setHeight(50)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.isEnabled = false
    return button
  }()

  private let forgotPasswordButton: UIButton = {
    let button = UIButton(type: .system)
    button.attributedTitle(normalText: "Forgot your password", boldedText: "Get help signing in")
    return button
  }()


  private let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    button.attributedTitle(normalText: "Don't have an account?", boldedText: "Sign up")
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureNotificationObservers()
  }

  // MARK: - Actions
  @objc func handleShowSignUp() {
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }

  @objc func textDidChange(sender: UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } else {
      viewModel.password = sender.text
    }
    loginButton.backgroundColor = viewModel.buttonBackgroundColor
    loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    loginButton.isEnabled = viewModel.formIsValid
  }

  // MARK: - Helpers

  func configureUI() {
    configureGradientLayer()
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black

    configureGradientLayer()

    view.addSubview(iconImage)
    iconImage.centerX(inView: view)
    iconImage.setDimensions(height: 80, width: 120)
    iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

    let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
    stack.axis = .vertical
    stack.spacing = 20
    view.addSubview(stack)
    stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.centerX(inView: view)
    dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
  }

  func configureNotificationObservers() {
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }

}
