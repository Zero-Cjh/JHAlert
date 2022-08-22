//
//  JHAlert_String.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/18.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import Foundation

extension JHAlert {
    
    /// 取消按钮文字
    ///
    /// Default: 取消
    public var cancelString: String? {
        get {
            return self.normalCancelString
        }
        set {
            self.normalCancelString = newValue
        }
    }
    
    /// 确认按钮文字
    ///
    /// Default: 确认
    public var confirmString: String? {
        get {
            return self.normalConfirmString
        }
        set {
            self.normalConfirmString = newValue
        }
    }
}
