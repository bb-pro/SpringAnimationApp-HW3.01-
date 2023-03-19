//
//  AnimationModel.swift
//  SpringAnimationApp(HW3.01)
//
//  Created by Bektemur Mamashayev on 16/03/23.
//
import Foundation


struct Animation: CustomStringConvertible {
    
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        preset: \(preset)
        curve: \(curve)
        force: \(String(format: "$.02f", force))
        duration: \(String(format: "$.02f", duration))
        delay: \(String(format: "$.02f", delay))
        """
    }
    
    static func getRandomAnimation() -> Animation {
        Animation(
            preset: DataStore.shared.animations.randomElement()?.rawValue ?? "",
            curve: DataStore.shared.curve.randomElement()?.rawValue ?? "",
            force: Double.random(in: 0.5...6),
            duration: Double.random(in: 0.1...3),
            delay: Double.random(in: 0.1...0.9)
        )
    }
}
