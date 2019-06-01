//
//  SwiftySnacbar.swift
//  SwiftySnacbar
//
//  Created by MataraiKaoru on 2019/06/01.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import Foundation

public class SwiftySnacbar: NSObject {

    public func show() -> SnacbarView {
        print("show")
        let view = SnacbarView(frame: CGRect(x: 0, y: 0, width: 300, height: 48))
        return view
    }
}
