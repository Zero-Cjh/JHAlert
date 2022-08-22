//
//  JHAlert.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/16.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

/// 快捷单例
public let JHAlertManager = JHAlert.Manager

public class JHAlert {
    
    /// 单例
    public static let `Manager` = JHAlert.init()
    
    // MARK: - Private
    
    /// 默认取消按钮文字
    var normalCancelString: String?
    
    /// 默认确认按钮文字
    var normalConfirmString: String?
    
    /// 弹窗View
    /// 不要直接进行操作
    let mainView: JHAlertMainView = JHAlertMainView()
    
    init() {
        self.titleColor = .black
        self.msgColor = .black
        self.cancelColor = .systemBlue
        self.confirmColor = .systemBlue
        self.alertViewColor = .white
        self.backgroundColor = UIColor.init(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        self.titleFont = .systemFont(ofSize: 19, weight: .medium)
        self.msgFont = .systemFont(ofSize: 15, weight: .regular)
        self.cancelString = "取消"
        self.confirmString = "确定"
    }
    
}
