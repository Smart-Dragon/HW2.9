//
//  MainViewController.swift
//  HW2.9
//
//  Created by Алексей Маслобоев on 26.02.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit
import Spring

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nameAnimationLabal: UILabel!
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var startAnimationButton: UIButton!
    
    // MARK: - Private Properties
    
    private let animations = Spring.AnimationPreset.allCases
    private var currentAnimation: Spring.AnimationPreset!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        currentAnimation = animations.first
        startAnimationAction()
    }
    
    // MARK: - IBActions
    
    @IBAction func startAnimationAction() {
        startAnimation(currentAnimation.rawValue)
        prepareNextAnimation()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        animationView.layer.cornerRadius = 15
        startAnimationButton.layer.cornerRadius = 15
    }
    
    private func startAnimation(_ animation: String) {
        nameAnimationLabal.text = animation
        animationView.animation = animation
        animationView.animate()
    }
    
    private func prepareNextAnimation() {
        currentAnimation = animations.next(from: currentAnimation)
        startAnimationButton.setTitle(currentAnimation.rawValue, for: .normal)
    }

}

// MARK: - Extension Array

extension Array where Element: Hashable {
    func next(from item: Element) -> Element? {
        if let index = self.firstIndex(of: item), index + 1 <= self.count {
            return index + 1 == self.count ? self[0] : self[index + 1]
        }
        return nil
    }
}
