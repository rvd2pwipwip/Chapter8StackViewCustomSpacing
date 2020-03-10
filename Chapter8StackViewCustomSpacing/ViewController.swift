//
//  ViewController.swift
//  Chapter8StackViewCustomSpacing
//
//  Created by Herve Desrosiers on 2020-03-10.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum LabelMetrics {
        static let headerFont: UIFont = .systemFont(ofSize: 48)
        static let itemFont: UIFont = .systemFont(ofSize: 24)
        static let footerFont: UIFont = .systemFont(ofSize: 12)
        static let footerText: String = "Some footer text in a much smaller font size"
        static let spacing: CGFloat = 8
        static let largeSpacing: CGFloat = 32
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(rootStackView)
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor),
            greenView.topAnchor.constraint(equalTo: rootStackView.topAnchor),
            greenView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor),
        ])
    }

    private let headerLabel = UILabel.customLabel(text: "Header", backgroundColor: .yellow, font: LabelMetrics.headerFont)
    private let topLabel = UILabel.customLabel(text: "Top Label", backgroundColor: .yellow, font: LabelMetrics.itemFont)
    private let middleLabel = UILabel.customLabel(text: "Middle Label", backgroundColor: .yellow, font: LabelMetrics.itemFont)
    private let bottomLabel = UILabel.customLabel(text: "Bottom Label", backgroundColor: .yellow, font: LabelMetrics.itemFont)
    private let footerLabel = UILabel.customLabel(text: LabelMetrics.footerText, backgroundColor: .yellow, font: LabelMetrics.footerFont)
    
    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, topLabel, middleLabel, bottomLabel, footerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertSubview(greenView, at: 0)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = LabelMetrics.spacing
        // available in iOS 11
//        stackView.isBaselineRelativeArrangement = true
        stackView.setCustomSpacing(32.0, after: headerLabel)
        stackView.setCustomSpacing(32.0, after: bottomLabel)
        
        // 8 point margins
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        return stackView
    }()

}

extension UILabel {
    static func customLabel(text: String, backgroundColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.backgroundColor = backgroundColor
        label.font = font
        label.numberOfLines = 0
        return label
    }
}
