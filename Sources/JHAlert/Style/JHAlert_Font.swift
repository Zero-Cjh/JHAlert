//
//  JHAlert_Font.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/18.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

extension JHAlert {
    
    /// 标题字体
    ///
    /// Default:
    ///     Size: 19
    ///     weight: medium
    public var titleFont: UIFont? {
        get {
            return self.mainView.titleFont
        }
        set {
            self.mainView.titleFont = newValue
        }
    }
    
    /// 信息字体
    ///
    /// Default:
    ///     Size: 15
    ///     weight: regular
    public var msgFont: UIFont? {
        get {
            return self.mainView.msgFont
        }
        set {
            self.mainView.msgFont = newValue
        }
    }
    
}
