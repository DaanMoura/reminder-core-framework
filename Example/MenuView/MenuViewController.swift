//
//  ViewController.swift
//  Example
//
//  Created by Daniel Moura on 04/11/25.
//

import UIKit

class MenuViewController: UIViewController {
  private let contentView = MenuView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
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

}
