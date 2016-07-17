//
//  TelegramActivity.swift
//  TelegramAnimation
//
//  Created by Andrii Kravchenko on 7/16/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit
import QuartzCore

class TelegramActivity: UIView {

    private let leftSquare = CALayer()
    private let rightSquare = CALayer()
    private var timer: CADisplayLink?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func startAnimate() {
        let leftAnimation = CABasicAnimation(keyPath: "position.x")
        leftAnimation.toValue = bounds.size.width/2
        leftAnimation.duration = 2
        leftAnimation.repeatCount = MAXFLOAT
        leftAnimation.autoreverses = true

        leftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        leftSquare.addAnimation(leftAnimation, forKey: "leftxAnimation")

        let rightAnimation = CABasicAnimation(keyPath: "position.x")
        rightAnimation.toValue = 0.0
        rightAnimation.duration = 2
        rightAnimation.repeatCount = MAXFLOAT
        rightAnimation.autoreverses = true

        rightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rightSquare.addAnimation(leftAnimation, forKey: "rightxAnimation")
        rightSquare.delegate = self

        timer = CADisplayLink(target: self, selector: #selector(timerFires))
        timer?.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }

    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        super.drawLayer(layer, inContext: ctx)

        let intersection = CGRectIntersection(leftSquare.presentationLayer()!.frame, rightSquare.presentationLayer()!.frame)

        CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0)
        let affineAffectedScaleFactor = leftSquare.frame.size.width / leftSquare.bounds.size.width
        CGContextFillRect(ctx, CGRectMake(0, 0, intersection.width/affineAffectedScaleFactor, intersection.width/affineAffectedScaleFactor))
    }

    func stopAnimate() {
        timer?.invalidate()

        leftSquare.removeAllAnimations()
        rightSquare.removeAllAnimations()
        rightSquare.setNeedsDisplay()
    }

    deinit {
        timer?.invalidate()
    }

    @objc private func timerFires() {
        self.rightSquare.setNeedsDisplay()
    }

    private func setup() {
        backgroundColor = UIColor.clearColor()
        clipsToBounds = false

        leftSquare.backgroundColor = UIColor.blackColor().CGColor
        rightSquare.backgroundColor = UIColor.blueColor().CGColor

        leftSquare.frame = CGRect(origin: CGPoint(x: 0, y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.height/2))

        let rotation = CATransform3DMakeRotation(CGFloat(-45.0 * M_PI / 180.0), 0.0, 0.0, 1.0)
        leftSquare.transform = CATransform3DTranslate(rotation, 0.0, 0.0, 1.0)

        rightSquare.frame = CGRect(origin: CGPoint(x: CGRectGetMaxX(leftSquare.frame), y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.height/2))
        rightSquare.transform = CATransform3DTranslate(rotation, 0.0, 0.0, 1.0)

        layer.addSublayer(leftSquare)
        layer.addSublayer(rightSquare)
    }

    override func layoutSublayersOfLayer(layer: CALayer) {
        super.layoutSublayersOfLayer(layer)
        leftSquare.frame = CGRect(origin: CGPoint(x: 0.0, y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.width/2))
        rightSquare.frame = CGRect(origin: CGPoint(x: CGRectGetMaxX(leftSquare.frame), y: bounds.size.height/4), size: CGSize(width: bounds.size.width/2, height: bounds.size.width/2))
    }

}
