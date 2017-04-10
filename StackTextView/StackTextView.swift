//
//  StackTextView.swift
//  StackTextView
//
//  Created by Zheng-Xiang Ke on 2017/4/10.
//  Copyright © 2017年 Zheng-Xiang Ke. All rights reserved.
//

import Foundation
import UIKit

open class StackTextView: UITextView {
    
    open var arranged​Subviews = [UIView]()
    open var spacing: CGFloat = 0
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        registerNotifications()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        registerNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    open func addArrangedSubview(_ view: UIView) {
        arranged​Subviews.append(view)
        addSubview(view)
        setContentHeight()
    }
    
    open func insertArrangedSubview(_ view: UIView, at: Int) {
        arranged​Subviews.insert(view, at: at)
        addSubview(view)
        setContentHeight()
    }
    
    open func removeArrangedSubview(_ view: UIView) {
        guard let index = arranged​Subviews.index(of: view) else {
            return
        }
        
        arranged​Subviews.remove(at: index)
        view.removeFromSuperview()
        setContentHeight()
    }
    
    fileprivate func setContentHeight() {
        let size = sizeThatFits(frame.size)
        
        contentSize.height = size.height + arranged​Subviews.reduce(0.0) {
            (totalSubviewsHeight, view) -> CGFloat in
            view.frame.origin.y = size.height + totalSubviewsHeight
            return totalSubviewsHeight + view.frame.size.height + spacing
        }
    }
    
    fileprivate func registerNotifications() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(textViewDidChange(notification:)), name: Notification.Name.UITextViewTextDidChange, object: self)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc fileprivate func textViewDidChange(notification: Notification) {
        setContentHeight()
    }
    
    @objc fileprivate func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardFrameEndUserInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        var rect = keyboardFrameEndUserInfo.cgRectValue
        rect = convert(rect, from: nil)
        contentInset.bottom = rect.size.height
        scrollIndicatorInsets.bottom = rect.size.height
    }
    
    @objc fileprivate func keyboardWillHide(notification: Notification) {
        contentInset.bottom = 0
        scrollIndicatorInsets.bottom = 0
    }
}
