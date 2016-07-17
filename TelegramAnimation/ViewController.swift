//
//  ViewController.swift
//  TelegramAnimation
//
//  Created by Andrii Kravchenko on 7/16/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let activity = TelegramActivity()
        activity.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activity)

        let xConstraint = NSLayoutConstraint(item: activity, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: activity, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: activity, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: activity, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 100)

        NSLayoutConstraint.activateConstraints([xConstraint, yConstraint, widthConstraint, heightConstraint])
    }

}

