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
    
    private var currentAnimation: AnimationModel!
    private var nextAnimation: AnimationModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAnimation = AnimationModel.getRandomAnimation()
    }
    
    @IBAction func animatePressed(_ sender: SpringButton) {
        nextAnimation = AnimationModel.getRandomAnimation()
        sender.setTitle(nextAnimation.preset, for: .normal)
        animate(with: currentAnimation)
        
    }
    
}

extension SpringAnimationViewController {

    func animate(with animation: AnimationModel) {
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = animation.force
        springAnimationView.duration = animation.duration
        springAnimationView.delay = animation.delay
        springAnimationView.animate()
        updateUI(with: animation)
        currentAnimation = nextAnimation
    }
    func updateUI(with data: AnimationModel) {
        presetLabel.text = data.preset
        curveLabel.text = data.curve
        forceLabel.text = data.force.formatted()
        durationLabel.text = data.duration.formatted()
        delayLabel.text = data.delay.formatted()
    }
}

