//
//  Extensions.swift
//  
//
//  Created by iosdev on 03/04/2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit



/**
 This is a extension created to extend functions for UIViews in the project
 */
extension UIView {
    
    /// Call this function to apply gradient color for UIView
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    /// Call this function to apply gradient color for UIView
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// Call this function to anchor controls in UIView
    func anchor(top: NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?, right:NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft:CGFloat, paddingBottom: CGFloat, paddingRight:CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        
    }
   
   
    /// Call this function to add backgorind color to UIView
    func addBackground(imageName: String!, contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}

/**
 This is a extension created to extend functions for UIViewControllers in the project
 */
extension UIViewController {
    
    /// Call this function to show alert message to user in UIViewController
    func displayMessageToUser(title: String?, msg:String?, style: UIAlertController.Style = .alert) {
        let ac = UIAlertController.init(title: title,
                                        message: msg, preferredStyle: style)
        ac.addAction(UIAlertAction.init(title: "OK",
                                        style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    /// Call this function to add custom back button in navigation controller
    func addBackButton(buttonTitle:String?) {
            let btnLeftMenu: UIButton = UIButton()
            let image = UIImage(named: arrowLeftImage);
            btnLeftMenu.setImage(image, for: .normal)
            guard let bTitle = buttonTitle else {return}
            let myNormalAttributedTitle = NSAttributedString(string: bTitle,
                                                             attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
            
            btnLeftMenu.setAttributedTitle(myNormalAttributedTitle, for: .normal)
            btnLeftMenu.sizeToFit()
            btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: btnLeftMenu)
            self.navigationItem.leftBarButtonItem = barButton
        }
    
    
    /// Call this function to handle the back button action when clicked
    @objc func backButtonClick(sender : UIButton) {
            self.navigationController?.popViewController(animated: true);
    }
    
  
    
    /// Call this function to hide keyboard when tapped anywhere in the UIViewController
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    /// Call this function to hide keyboard when tapped anywhere in the UIViewController
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
  
}




extension String {
   
    /// Call this function to validate email entered by the user
    func isValidEmailString(testStr:String) -> Bool {
        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
  
    /// Call this function to validate password entered by the user
    func isValidPassword(_ input: String) -> Bool {
        let pattern = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\w~@#$%^&*+=`|{}:;!.?\"()\[\]-_]{8,16}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: input)
    }
}



