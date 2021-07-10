//
//  ViewController.swift
//  StackScrollView
//
//  Created by Isaías Santana on 10/07/21.
//

import UIKit

final class ViewController: UIViewController {
    private let sampleView = SampleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "StackScrollView"
    }

    override func loadView() {
        view = sampleView
    }
}

