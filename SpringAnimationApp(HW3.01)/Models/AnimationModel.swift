//
//  AnimationModel.swift
//  SpringAnimationApp(HW3.01)
//
//  Created by Bektemur Mamashayev on 16/03/23.
//
import Foundation
import SpringAnimation


struct AnimationModel {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    static func getRandomAnimation() -> AnimationModel {
        AnimationModel(
            preset: AnimationPreset.allCases.randomElement()?.rawValue ?? "slideDown",
            curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "easeInQuad",
            force: CGFloat.random(in: 0.5...6),
            duration: CGFloat.random(in: 0.1...3),
            delay: CGFloat.random(in: 0.1...0.9)
        )
    }
}
