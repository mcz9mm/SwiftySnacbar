//
//  SnackbarConfigure.swift
//  SwiftySnackbar
//
//  Created by MataraiKaoru on 2019/06/02.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import UIKit

/// Snackbar Configre Model
public final class SnackbarConfigure {

    var text: String?

    var textColor: UIColor?

    var buttonText: String?

    var buttonTextColor: UIColor?

    var cornerRadius: CGFloat?

    var shadowRadius: CGFloat?

    var shadowOpacity: Float?

    var shadowOffset: CGSize?

    var shadowColor: UIColor?

    init(text: String = "Hello SwiftySnacbar!",
         textColor: UIColor = .white,
         buttonText: String = "Action",
         buttonTextColor: UIColor = .blue,
         cornerRadius: CGFloat = 4.0,
         shadowRadius: CGFloat = 1.0,
         shadowOpacity: Float = 1.0,
         shadowOffset: CGSize = CGSize(width: 1, height: 1),
         shadowColor: UIColor = .black) {

        self.text = text
        self.textColor = textColor
        self.buttonText = buttonText
        self.buttonTextColor = buttonTextColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.shadowOffset = shadowOffset
    }
}
