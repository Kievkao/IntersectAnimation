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

        let xConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: telegramActivity, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 200)

        NSLayoutConstraint.activate([xConstraint, yConstraint, widthConstraint, heightConstraint])
    }

    @IBAction func startAnimateAction(sender: AnyObject) {
        telegramActivity.startAnimate()
    }

    @IBAction func stopAnimateAction(sender: AnyObject) {
        telegramActivity.stopAnimate()
    }

}

