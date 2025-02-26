//
//  InputTextField.swift
//  Cergio
//
//  Created by iosdev on 23/11/2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit


/// This class is created as reusable control for input textfield
@IBDesignable class InputTextField: UITextField {
    
    /// This function returns an object initialized from data in a given unarchiver.
    /// This function initializes and returns a newly allocated view object with the specified frame rectangle.
    ///
    /// - Parameters:
    ///   - frame: The `frame` payload.
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    /// This function returns an object initialized from data in a given unarchiver.
    /// - Parameters:
    ///   - aDecoder: The `aDecoder` payload.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    /// Thic function is created to handle the custom properties of UIButton
    func sharedInit() {
        self.font = .systemFont(ofSize: 16)
        self.backgroundColor = UIColor(white: 0, alpha: 0.00)
      //  self.setBottomBorder()
        self.textColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        let spacerView = UIView(frame:CGRect(x:15, y:0, width:10, height:10))
        self.leftViewMode = UITextField.ViewMode.always
        self.leftView = spacerView

    }
    
}
