//
//  ViewController.swift
//  CodingExam
//
//  Created by Yuan Soliman on 2/26/25.
//

import UIKit

class Login: UIViewController {
    /// the declaration of uibutton image for hide/show password
    var eyeButton: UIButton!
    
    
    /// Creation of UILabel to handle email label
    let titleEmail: UILabel = {
        let label = UILabel()
        label.text = emailTitle
        return label
    }()
    
    /// Creation of UITextField to handle email value
    let emailTextfield: InputTextField = {
        let textfield = InputTextField()
        textfield.placeholder = emailPlaceholder
        return textfield
    }()
    /// Creation of UILabel to handle email error message
    let emailErrorLabel: InputErrorLabel = {
        let label = InputErrorLabel()
        label.text = emailErrorText
        label.isHidden = true
        return label
    }()
    
    /// Creation of UILabel to handle password label
    let titlePassword: UILabel = {
        let label = UILabel()
        label.text = passwordTitle
        return label
    }()
    
    let showButton : UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setImage(UIImage(named: showPasswordImage), for: .normal)
        return btn
    }()
    
    /// Creation of UITextField to handle password value
    let passwordTextfield: InputTextField = {
        let textfield = InputTextField()
        textfield.placeholder = passwordTitle
        textfield.textColor = .black
        textfield.isSecureTextEntry = true
        textfield.clipsToBounds = true
        textfield.isUserInteractionEnabled = true
        return textfield
    }()
    
    /// Creation of UILabel to handle password error message
    let passwordErrorLabel: InputErrorLabel = {
        let label = InputErrorLabel()
        label.text = passwordErrorText
        label.numberOfLines = 3
        label.isHidden = true
        return label
    }()
    
    /// Creation of RoundButton to handle the Login process
    lazy var loginButton : RoundButton = {
        let button = RoundButton()
        button.setTitle(loginTitle, for: .normal)
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLoginButton(){
        // validate email
        guard let email = emailTextfield.text, !email.isEmpty else{
            displayMessageToUser(title: errorLoginTitle, msg: emailErrorText)
            return
        }
        let isValidEmail = email.isValidEmailString(testStr: email)
        if isValidEmail {
            emailErrorLabel.isHidden = true
                //validate password
                guard let password = passwordTextfield.text, !password.isEmpty else{
                    displayMessageToUser(title: errorLoginTitle, msg: passwordErrorText)
                    return
                }
            let isValidPassword = password.isValidPassword(password)
                if isValidPassword {
                    passwordErrorLabel.isHidden = true
                    //go to welcome screen
                    self.goToWelcomeScreen()
                }else{
                    passwordErrorLabel.isHidden = false
                }
        }else{
            emailErrorLabel.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = loginTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.setUpView()
        hideKeyboardWhenTappedAround()
    }
    
    /// This function is handle the creation of eye image button in password textfield for show/hide of password
    fileprivate func addShowHideButton(){
        let frame = CGRect(x: 0,y: 0, width: 50, height: 30)
        eyeButton = UIButton(frame: frame)
        eyeButton.backgroundColor = .clear
        eyeButton.setImage(UIImage(named: showPasswordImage), for: .normal)
        self.passwordTextfield.rightViewMode = UITextField.ViewMode.always
        eyeButton.addTarget(self, action: #selector(toggleShowPassword(_:)), for: UIControl.Event.touchUpInside)
        self.passwordTextfield.rightView = eyeButton
        self.passwordTextfield.addSubview(eyeButton)
    }
    
    /// This function handle the hide/show of text in the password field
     /// - Parameters:
     ///   - sender: The `sender` as AnyObject value.
    @objc fileprivate func toggleShowPassword(_ sender:AnyObject){
        self.passwordTextfield.isSecureTextEntry = !self.passwordTextfield.isSecureTextEntry
        self.changeImageWithAnimation()
    }
    
    /// This function is created to handle the animation of hiding/showing password
    fileprivate func changeImageWithAnimation(){
        eyeButton.alpha = 0
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            self.eyeButton.alpha = 1
            if self.passwordTextfield.isSecureTextEntry {
                self.eyeButton.setImage(UIImage(named: showPasswordImage), for: UIControl.State())
            }else {
                self.eyeButton.setImage(UIImage(named: hidePasswordImage), for: UIControl.State())
                self.resetTextFont()
            }
        }, completion: nil)
    }
    
    /// This function created  to display the password in textfield
    fileprivate func resetTextFont(){
        self.passwordTextfield.attributedText = NSAttributedString(string: self.passwordTextfield.text!)
    }
    
    func goToWelcomeScreen() {
        let welcomeVC = Welcome()
        welcomeVC.email = emailTextfield.text
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    func setUpView() {
        
        // add the hide and show button inside the password textfield
        self.addShowHideButton()
        
        view.addSubview(titleEmail)
        titleEmail.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 25)
    
        view.addSubview(emailTextfield)
        emailTextfield.anchor(top: titleEmail.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        view.addSubview(emailErrorLabel)
        emailErrorLabel.anchor(top: emailTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        view.addSubview(titlePassword)
        titlePassword.anchor(top: emailErrorLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20)

        view.addSubview(passwordTextfield)
        passwordTextfield.anchor(top: titlePassword.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        view.addSubview(passwordErrorLabel)
        passwordErrorLabel.anchor(top: passwordTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordErrorLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 48)
                
       
    }

}

