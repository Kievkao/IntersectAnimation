//
//  ViewController.swift
//  TelegramAnimation
//
//  Created by Andrii Kravchenko on 7/16/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let telegramActivity = TelegramActivity()

    override func viewDidLoad() {
        super.viewDidLoad()

        telegramActivity.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(telegramActivity)

        let xConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 100)

        NSLayoutConstraint.activateConstraints([xConstraint, yConstraint, widthConstraint, heightConstraint])
    }

    @IBAction func startAnimateAction(sender: AnyObject) {
        telegramActivity.startAnimate()
    }

    @IBAction func stopAnimateAction(sender: AnyObject) {
        telegramActivity.stopAnimate()
    }

}

