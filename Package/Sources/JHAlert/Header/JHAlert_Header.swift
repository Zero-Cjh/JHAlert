//
//  JHAlert_Header.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/5.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

class JHAlertHeader {
    static var rootView: UIView? {
        guard let rootWindow: UIWindow = UIApplication.shared.delegate?.window as? UIWindow,
              let rootView = rootWindow.rootViewController?.view as? UIView
        else {
            return nil
        }
        return rootView
    }
}
