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

    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func loadNib() {
        let loadView = Bundle.main.loadNibNamed("SnacbarView", owner: self, options: nil)?.first as! UIView
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
    }

    func setView() {
        label.text = "foo"
    }
}
