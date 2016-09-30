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

    var animationDuration: CFTimeInterval = 0.7

    private let leftSquare = CALayer()
    private let rightSquare = CALayer()
    private var timer: CADisplayLink?

    private var animating = false

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
        leftAnimation.duration = animationDuration
        leftAnimation.repeatCount = MAXFLOAT
        leftAnimation.autoreverses = true

        leftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        leftSquare.add(leftAnimation, forKey: "leftxAnimation")

        let rightAnimation = CABasicAnimation(keyPath: "position.x")
        rightAnimation.toValue = 0.0
        rightAnimation.duration = animationDuration
        rightAnimation.repeatCount = MAXFLOAT
        rightAnimation.autoreverses = true

        rightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rightSquare.add(leftAnimation, forKey: "rightxAnimation")
        rightSquare.delegate = self

        animating = true

        timer = CADisplayLink(target: self, selector: #selector(timerFires))
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }

    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)

        if animating {
            let intersection = leftSquare.presentation()!.frame.intersection(rightSquare.presentation()!.frame)
            
            ctx.setFillColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            let affineAffectedScaleFactor = leftSquare.frame.size.width / leftSquare.bounds.size.width
            ctx.fill(CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: intersection.width/affineAffectedScaleFactor, height: intersection.width/affineAffectedScaleFactor)))
        }
        else {
            ctx.clear(rightSquare.bounds)
        }
    }

    func stopAnimate() {
        animating = false
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
        backgroundColor = UIColor.clear
        clipsToBounds = false

        leftSquare.backgroundColor = UIColor.black.cgColor
        rightSquare.backgroundColor = UIColor.blue.cgColor

        let sideLength = bounds.size.width / 2 / 2*sqrt(2)
        let xOffset = (sqrt(2)*sideLength - sideLength) / 2

        leftSquare.frame = CGRect(origin: CGPoint(x: xOffset, y: sideLength), size: CGSize(width: sideLength, height: sideLength))
        rightSquare.frame = CGRect(origin: CGPoint(x: xOffset + sqrt(2)*sideLength, y: sideLength), size: CGSize(width: sideLength, height: sideLength))

        let rotation = CATransform3DMakeRotation(CGFloat(-45.0 * M_PI / 180.0), 0.0, 0.0, 1.0)
        leftSquare.transform = CATransform3DTranslate(rotation, 0.0, 0.0, 1.0)

        rightSquare.transform = CATransform3DTranslate(rotation, 0.0, 0.0, 1.0)

        layer.addSublayer(leftSquare)
        layer.addSublayer(rightSquare)
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)

        let sideLength = bounds.size.width / 2 / 2*sqrt(2)
        let xOffset = (sqrt(2)*sideLength - sideLength) / 2
        
        leftSquare.frame = CGRect(origin: CGPoint(x: xOffset, y: sideLength), size: CGSize(width: sideLength, height: sideLength))
        rightSquare.frame = CGRect(origin: CGPoint(x: xOffset + sqrt(2)*sideLength, y: sideLength), size: CGSize(width: sideLength, height: sideLength))
    }
}
