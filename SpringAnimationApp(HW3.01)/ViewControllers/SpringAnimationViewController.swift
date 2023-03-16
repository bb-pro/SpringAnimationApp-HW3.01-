//
//  ViewController.swift
//  SpringAnimationApp(HW3.01)
//
//  Created by Bektemur Mamashayev on 16/03/23.
//

import UIKit
import SpringAnimation

final class SpringAnimationViewController: UIViewController {
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animateButton: SpringButton!
    
    private var currentAnimation: Animation!
    private var nextAnimation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        currentAnimation = Animation.getRandomAnimation()
        animateButton.setTitle("Run \(currentAnimation.preset)", for: .normal)
    }
    
    @IBAction func animatePressed() {
        nextAnimation = Animation.getRandomAnimation()
        animateButton.setTitle("Run \(nextAnimation.preset)", for: .normal)
        animate(with: currentAnimation)
    }
}

private extension SpringAnimationViewController {

    func animate(with animation: Animation) {
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = animation.force
        springAnimationView.duration = animation.duration
        springAnimationView.delay = animation.delay
        springAnimationView.animate()
        updateUI(with: animation)
        currentAnimation = nextAnimation
    }
    
    func updateUI(with data: Animation) {
        presetLabel.text = data.preset
        curveLabel.text = data.curve
        forceLabel.text = stringFrom(data.force)
        durationLabel.text = stringFrom(data.duration)
        delayLabel.text = stringFrom(data.delay)
    }
    
    func setupScreen(){
        springAnimationView.layer.cornerRadius = 10
        animateButton.layer.cornerRadius = 10
    }
    
    func stringFrom(_ number: CGFloat) -> String {
        String(format: "%.2f", number)
    }
}

