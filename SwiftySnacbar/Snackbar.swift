//
//  Snackbar.swift
//  SwiftySnacbar
//
//  Created by MataraiKaoru on 2019/06/02.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import UIKit

class Snackbar {

    private var snackbarView: SnacbarView?

    // MARK - Instance
    public static func show(with model: SnackbarConfigure, fromView: UIView, duration: DispatchTime = DispatchTime.now() + 3.0, completion: (() -> ())?) {

        // setting view frame
        let viewHeight: CGFloat = 48.0
        let margin: CGFloat = 16.0
        var bottomPadding: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            bottomPadding = window?.safeAreaInsets.bottom ?? 0
        }

        let frame = CGRect(x: margin,
                           y: fromView.frame.height - viewHeight - margin - bottomPadding,
                           width: fromView.frame.width - margin - margin,
                           height: viewHeight)

        // create view
        let view = SnacbarView(frame: frame, model: model)
        fromView.addSubview(view)

        DispatchQueue.main.asyncAfter(deadline: duration) {
            view.removeFromSuperview()
            completion?()
        }
    }
}

