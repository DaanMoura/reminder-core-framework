//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Daniel Moura on 29/10/25.
//

import Foundation
import UIKit

public class OnboardingView: UIView {
  private var steps: [OnboardingStep] = []
  private var currentStep: Int = 0
  
  private let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.gray100.withAlphaComponent(0.6)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
//  private let centerContainer: UIView = {
//    let view = UIView()
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 120, weight: .regular)
    imageView.tintColor = Colors.gray700
    return imageView
  }()
  
  private let messageLabel: UILabel = {
    let label = UILabel()
    label.textColor = Colors.gray700
    label.font = Typography.heading
    label.numberOfLines = 0
    label.textAlignment = .center
    label.alpha = 0
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
//    addSubview(centerContainer)
    
//    centerContainer.addSubview(imageView)
//    centerContainer.addSubview(messageLabel)
//    centerContainer.addSubview(nextButton)
    
    addSubview(imageView)
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
      
//      centerContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
//      centerContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
//      
//      imageView.centerXAnchor.constraint(equalTo: centerContainer.centerXAnchor),
//      imageView.topAnchor.constraint(equalTo: centerContainer.topAnchor),
//      
//      messageLabel.centerXAnchor.constraint(equalTo: centerContainer.centerXAnchor),
//      messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.medium),
//      
//      nextButton.centerXAnchor.constraint(equalTo: centerContainer.centerXAnchor),
//      nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium)
      
      
      
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
      imageView.widthAnchor.constraint(equalToConstant: 200),
      imageView.heightAnchor.constraint(equalToConstant: 200),

      messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.medium),
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
      updateStep(animated: true)
    } else {
      dismiss()
    }
  }
    
  public func presentOnboarding(on view: UIView, with steps: [OnboardingStep]) {
    self.steps = steps
    self.currentStep = 0
    
    view.addSubview(self)
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor),
      leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottomAnchor.constraint(equalTo: view.bottomAnchor),
      trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
    updateStep(animated: true)
  }
  
  private func updateStep(animated: Bool = false) {
    let step = steps[currentStep]
    imageView.image = step.image?.withRenderingMode(.alwaysTemplate)
    messageLabel.text = step.text
    if animated {
      self.imageView.removeAllSymbolEffects()
      self.layoutIfNeeded()
      DispatchQueue.main.async {
        self.imageView.addSymbolEffect(.drawOn.byLayer, options: .repeat(1))
      }
      self.animateTextEntry()
    } else {
      messageLabel.alpha = 1
      messageLabel.transform = .identity
    }
  }
  
  private func animateTextEntry() {
    messageLabel.alpha = 0
    messageLabel.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
      self.messageLabel.alpha = 1
      self.messageLabel.transform = .identity
    })
  }
  
  private func dismiss() {
    removeFromSuperview()
  }
}

public typealias OnboardingStep = (image: UIImage?, text: String)
