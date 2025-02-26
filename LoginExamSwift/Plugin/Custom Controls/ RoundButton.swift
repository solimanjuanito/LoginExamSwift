//
//  ActionButton.swift
//  Cergio
//
//  Created by iosdev on 21/11/2018.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit


/// This class is created as reusable control for UIButton
@IBDesignable class RoundButton: UIButton {
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
        self.tintColor = UIColor.white
        self.setImage(UIImage(named:""), for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.backgroundColor = .systemCyan
        self.layer.cornerRadius = 10
    }
}
