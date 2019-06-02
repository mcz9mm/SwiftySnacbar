//
//  SnacbarView.swift
//  SwiftySnacbar
//
//  Created by MataraiKaoru on 2019/06/01.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import UIKit

protocol SnacbarViewDelegate: class {
    func shouldDismissCustomDialog() -> Void
}

class SnacbarView: UIView {

    //    weak var delegate: SnacbarViewDelegate?

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var actionButton: UIButton!

    init(frame: CGRect, model: SnackbarConfigure) { // for using CustomView in code
        super.init(frame: frame)
        self.loadNib(model: model)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func loadNib(model: SnackbarConfigure) {
        let loadView = Bundle.main.loadNibNamed("SnacbarView", owner: self, options: nil)?.first as! SnacbarView
        loadView.frame = self.bounds
        addSubview(loadView)

        loadView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": loadView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": loadView]))


        loadView.layer.cornerRadius = model.cornerRadius ?? 4.0
        loadView.layer.shadowRadius = model.shadowRadius ?? 1.0
        loadView.layer.shadowOpacity = model.shadowOpacity ?? 0.2
        loadView.layer.shadowOffset = model.shadowOffset ?? CGSize(width: 1, height: 1)
        loadView.layer.shadowColor = model.shadowColor?.cgColor ?? nil

        loadView.label.text = model.text
        loadView.label.textColor = model.textColor

        guard let butotnText = model.buttonText else {
            loadView.actionButton.isHidden = true
            return
        }

        loadView.actionButton.setTitle(butotnText, for: [.normal, .highlighted, .selected])
        loadView.actionButton.setTitleColor(model.buttonTextColor, for: [.normal, .highlighted, .selected])
    }
}
