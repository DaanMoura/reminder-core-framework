//
//  ViewController.swift
//  Example
//
//  Created by Daniel Moura on 04/11/25.
//

import UIKit
import CoreFramework

class MenuViewController: UIViewController {
  private let contentView = MenuView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupActions()
  }
  
  private func setupActions() {
    contentView.didTapOnboarding = { [weak self] in
      self?.showOnboarding()
    }
  }

  private func setupView() {
    view.backgroundColor = .white
    view.addSubview(contentView)
//    view.setapp

    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: view.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func showOnboarding() {
    let onboarding = OnboardingView()
//    let steps = ["Welcome!", "Step 1", "Step 2", "Finish!"]
    let steps: [OnboardingStep] = [
      (UIImage(systemName: "pills"), "Welcome!!"),
      (UIImage(systemName: "figure.walk"), "Step 1"),
      (UIImage(systemName: "cross.case"), "Step 2"),
      (UIImage(systemName: "heart"), "Done!"),
    ]
    onboarding.presentOnboarding(on: view, with: steps)
  }

}
