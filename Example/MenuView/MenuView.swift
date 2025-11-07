//
//  MenuView.swift
//  CoreFramework
//
//  Created by Daniel Moura on 04/11/25.
//

import Foundation
import UIKit
import CoreFramework

class MenuView: UIView {
  var didTapOnboarding: (() -> Void)?
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Example Menu"
    label.font = Typography.heading
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let onboardingButton: UIButton = {
    let button = UIButton(type: .system)
    button.configuration = .prominentGlass()
    button.setTitle("Onboarding", for: .normal)
    button.layer.cornerRadius = Metrics.medium
    button.tintColor = Colors.gray100
    button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let testCheckboxButton: UIButton = {
    let button = UIButton(type: .system)
    button.configuration = .prominentGlass()
    button.setTitle("Test checkbox", for: .normal)
    button.layer.cornerRadius = Metrics.medium
    button.tintColor = Colors.gray100
    button.addTarget(self, action: #selector(didTapCheckboxButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    addSubview(titleLabel)
    addSubview(onboardingButton)
    addSubview(testCheckboxButton)
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.medium),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      onboardingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
      onboardingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      onboardingButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
      
      testCheckboxButton.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: Metrics.small),
      testCheckboxButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      testCheckboxButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight)
    ])
  }
  
  @objc
  private func didTapOnboardingButton() {
    didTapOnboarding?()
  }
  
  @objc
  private func didTapCheckboxButton() {
    let checkboxViewController = CheckboxViewController()
    if let parentViewController = self.window?.rootViewController {
      parentViewController.present(checkboxViewController, animated: true)
    }
  }
}
