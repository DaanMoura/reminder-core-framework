//
//  ButtonViewController.swift
//  CoreFramework
//
//  Created by Daniel Moura on 08/11/25.
//

import Foundation
import UIKit
import CoreFramework

class ButtonViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let redButton: Button = {
      let button = Button()
      button.setTitle("Red Button", for: .normal)
      button.tintColor = Colors.primaryRedBase
      return button
    }()
    
    let blueButton: Button = {
      let button = Button()
      button.setTitle("Blue Button", for: .normal)
      button.tintColor = Colors.primaryBlueBase
      return button
    }()
    
    let buttonWithImage: Button = {
      let button = Button()
      button.setTitle("Button with Image", for: .normal)
      button.setImage(UIImage(systemName: "star.fill"), for: .normal)
      return button
    }()
    
    view.addSubview(redButton)
    view.addSubview(blueButton)
    view.addSubview(buttonWithImage)
    
    NSLayoutConstraint.activate([
      redButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
      redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.large),
      redButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.large),
      redButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),

      blueButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: Metrics.medium),
      blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.large),
      blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.large),
      blueButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
      
      buttonWithImage.topAnchor.constraint(equalTo: blueButton.bottomAnchor, constant: Metrics.medium),
      buttonWithImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.large),
      buttonWithImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.large),
      buttonWithImage.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight)
    ])
  }
}
