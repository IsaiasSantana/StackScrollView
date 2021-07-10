//
//  SampleView.swift
//  StackScrollView
//
//  Created by Isaías Santana on 10/07/21.
//

import UIKit

final class SampleView: UIView {
    private let stackScrollView = StackScrollView()

    init() {
        super.init(frame: .zero)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupStackScrollView()
    }

    private func setupStackScrollView() {
        addSubview(stackScrollView)
        NSLayoutConstraint.activate([
            stackScrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stackScrollView.trailingAnchor),
            layoutMarginsGuide.bottomAnchor.constraint(equalTo: stackScrollView.bottomAnchor)
        ])
        setupSampleViews()
    }

    private func setupSampleViews() {
        for _ in 1...20 {
            stackScrollView.add(view: buildCustomUIView())
        }
    }

    private func buildCustomUIView() -> UIView {
        let color = randomColor()
        let customHeight = randomHeight()
        return createUIViewWithColor(color, customHeight: customHeight)
    }

    private func randomColor() -> UIColor {
        let colors: [UIColor] = [.red, .black, .cyan, .blue, .systemPink, .purple, .orange, .green, .lightGray]
        return colors.randomElement()!
    }

    private func randomHeight() -> CGFloat {
        let heights: [CGFloat] = [50, 100, 150, 200, 250, 500]
        return heights.randomElement()!
    }

    private func createUIViewWithColor(_ color: UIColor, customHeight: CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: customHeight).isActive = true
        view.backgroundColor = color
        return view
    }
}
