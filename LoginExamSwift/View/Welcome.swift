//
//  Welcome.swift
//  CodingExam
//
//  Created by Yuan Soliman on 2/26/25.
//

import UIKit

class Welcome: UIViewController {
    var email:String?
    override func viewDidLoad() {
        view.backgroundColor = .white
        addBackButton(buttonTitle: "")
        title = "Welcome"
    }
}

