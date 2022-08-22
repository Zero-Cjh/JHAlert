//
//  JHAlert_Method.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/16.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import Foundation

extension JHAlert {
    
    /// 显示警告弹窗
    /// - Parameters:
    ///   - title: 弹窗标题
    ///   - msg: 弹窗信息
    ///   - buttonCount: 按钮数量，默认显示2个按钮。当数量为0时，点击背景返回。当数量为1时，只显示ConfirmBtn。
    ///   - cancelString: 取消按钮文本
    ///   - confirmString: 确认按钮文本
    ///   - result: 用户选择结果，取消==NO, 确认==YES
    public func show(_ title: String,
                     msg: String? = nil,
                     buttonCount: Int = 2,
                     cancelString: String? = nil,
                     confirmString: String? = nil,
                     result: ((_ result: Bool) -> ())? = nil) {
        self.mainView.titleString = title
        self.mainView.msgString = msg
        self.mainView.buttonCount = buttonCount
        self.mainView.cancelString = cancelString ?? self.cancelString
        self.mainView.confirmString = confirmString ?? self.confirmString
        self.mainView.resultBlock(result)
        self.mainView.show()
    }
}
