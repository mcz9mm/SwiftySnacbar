//
//  SnacbarViewController.swift
//  SwiftySnackbar
//
//  Created by MataraiKaoru on 2019/06/02.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import UIKit

public class SnacbarViewController: UIViewController {

    // MARK - Instance
    public static func show(with configure: SnackbarConfigure, duration: DispatchTime = DispatchTime.now() + 3.0 , completion: (() -> ())?) {
        let view = SnacbarViewController.instantiate()
        view.snackbarModel = configure
        let topView = UIApplication.topViewController()
        topView?.present(view, animated: true, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: duration) {
            view.dismiss(animated: true, completion: completion)
        }
    }

    // MARK: - IBOutlet
    @IBOutlet private var snackbarView: UIView!

    @IBOutlet private weak var snackbarLabel: UILabel!

    @IBOutlet private weak var actionButton: UIButton!

    @IBAction private func didTappedActionButton(_ sender: UIButton) {

    }

    // MARK: - Properties
    private var snackbarModel = SnackbarConfigure()

    // MARK: - ViewLifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        configure(with: snackbarModel)
    }

    func configure(with model: SnackbarConfigure) {

        snackbarLabel.text = model.text
        snackbarLabel.textColor = model.textColor
        actionButton.setTitle(model.buttonText, for: [.normal, .highlighted, .selected])
        actionButton.setTitleColor(model.buttonTextColor, for: [.normal, .highlighted, .selected])
        snackbarView.layer.cornerRadius = model.cornerRadius ?? 4.0
        snackbarView.layer.shadowRadius = model.shadowRadius ?? 1.0
        snackbarView.layer.shadowOpacity = model.shadowOpacity ?? 0.2
        snackbarView.layer.shadowOffset = model.shadowOffset ?? CGSize(width: 1, height: 1)
        snackbarView.layer.shadowColor = model.shadowColor?.cgColor ?? nil
    }
}

extension SnacbarViewController: StoryboardInstantiable {
    // do not something
}
