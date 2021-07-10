//
//  StackScrollView.swift
//  StackScrollView
//
//  Created by Isaías Santana on 10/07/21.
//

import UIKit

final class StackScrollView: UIScrollView {
    private let contentScrollView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let stack = Stack()

    private let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
        translatesAutoresizingMaskIntoConstraints = false
        setupContentScrollView()
    }

    private func setupContentScrollView() {
        addSubview(contentScrollView)

        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentScrollView.widthAnchor.constraint(equalTo: widthAnchor),
            contentScrollView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor)
        ])
        setupContentView()
    }

    private func setupContentView() {
        contentScrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
        ])
        setupStack()
        setupBottomView()
    }

    private func setupStack() {
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    private func setupBottomView() {
        contentView.addSubview(bottomView)

        let topConstraint = bottomView.topAnchor.constraint(greaterThanOrEqualTo: stack.bottomAnchor)
        topConstraint.priority = .init(250)

        NSLayoutConstraint.activate([
            topConstraint,
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func add(view: UIView) {
        stack.add(view: view)
    }

    func add(views: [UIView]) {
        stack.add(views: views)
    }
}
