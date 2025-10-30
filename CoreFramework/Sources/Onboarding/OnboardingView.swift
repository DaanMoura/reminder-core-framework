//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Daniel Moura on 29/10/25.
//

import Foundation
import UIKit

public class OnboardingView: UIView {
  private var steps: [String] = []
  private var currentStep: Int = 0
  
  private let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.gray100.withAlphaComponent(0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let messageLabel: UILabel = {
    let label = UILabel()
    label.textColor = Colors.gray300
    label.font = Typography.heading
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Próximo", for: .normal)
    button.titleLabel?.font = Typography.body
    button.setTitleColor(Colors.primaryRedBase, for: .normal)
    button.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  public init() {
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    addSubview(backgroundView)
    addSubview(messageLabel)
    addSubview(nextButton)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
      messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
      
      nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium),
      nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
 
  @objc
  private func didTapNextStep() {
    currentStep += 1
    if currentStep < steps.count {
      updateStep()
    } else {
      dismiss()
    }
  }
    
  public func presentOnboarding(on view: UIView, with steps: [String]) {
    self.steps = steps
    self.currentStep = 0
    
    // TODO: create a function to iterate step + 1
    
    view.addSubview(self)
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor),
      leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottomAnchor.constraint(equalTo: view.bottomAnchor),
      trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
  private func updateStep() {
    messageLabel.text = steps[currentStep]
  }
  
  private func dismiss() {
    removeFromSuperview()
  }
}
