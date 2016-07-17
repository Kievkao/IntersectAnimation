//
//  TelegramActivity.swift
//  TelegramAnimation
//
//  Created by Andrii Kravchenko on 7/16/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class TelegramActivity: UIView {

    private var leftSquare = CALayer()
    private var rightSquare = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func startAnimate() {

    }

    func stopAnimate() {

    }

    private func setup() {
        backgroundColor = UIColor.clearColor()
        clipsToBounds = false

        leftSquare.backgroundColor = UIColor.blackColor().CGColor
        rightSquare.backgroundColor = UIColor.blueColor().CGColor

        leftSquare.frame = CGRect(origin: CGPoint(x: 0, y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.height/2))
        let rotation = CATransform3DMakeRotation(CGFloat(45.0 * M_PI / 180.0), 0, 0, 1)
        leftSquare.transform = CATransform3DTranslate(rotation, 0, 0, 1)

        rightSquare.frame = CGRect(origin: CGPoint(x: CGRectGetMaxX(leftSquare.frame), y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.height/2))
        rightSquare.transform = CATransform3DTranslate(rotation, 0, 0, 1)

        layer.addSublayer(leftSquare)
        layer.addSublayer(rightSquare)
    }

    override func layoutSublayersOfLayer(layer: CALayer) {
        super.layoutSublayersOfLayer(layer)
        leftSquare.frame = CGRect(origin: CGPoint(x: 0, y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.width/2))
        rightSquare.frame = CGRect(origin: CGPoint(x: CGRectGetMaxX(leftSquare.frame), y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.width/2))
    }

}
