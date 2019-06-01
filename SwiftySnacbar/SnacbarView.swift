//
//  SnacbarView.swift
//  SwiftySnacbar
//
//  Created by MataraiKaoru on 2019/06/01.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import UIKit

@IBDesignable
public class SnacbarView: UIView {

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var button: UIButton!

    @IBInspectable
    var text: String = "Hello SwiftySnacbar!"

    @IBInspectable
    var buttonText: String = "Action"

    @IBInspectable
    var textColor: UIColor = .white

    @IBInspectable
    var buttonTextColor: UIColor = .blue

    override public func layoutSubviews() {
        label.text = text
        label.textColor = textColor
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(buttonTextColor, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension SnacbarView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
