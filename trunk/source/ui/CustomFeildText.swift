//
//  CustomFeildText.swift
//  YiboGameIos
//
//  Created by yibo-johnson on 2018/2/1.
//  Copyright © 2018年 com.lvwenhan. All rights reserved.
//

import UIKit

class CustomFeildText: UITextField {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let bar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 44))
        //给金额输入法键盘添加"完成"按钮
        let shouqiBtn = UIButton.init(frame: CGRect.init(x: kScreenWidth - 65, y:7, width: 60, height: 30))
        shouqiBtn.setTitle("完成", for: UIControlState.normal)
        shouqiBtn.setTitleColor(UIColor.blue, for: .normal)
        shouqiBtn.layer.cornerRadius = 5
        shouqiBtn.layer.borderWidth = 1
        shouqiBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        shouqiBtn.layer.borderColor = UIColor.blue.cgColor
        shouqiBtn.addTarget(self, action: #selector(onShouqiClick(view:)), for: UIControlEvents.touchUpInside)
        bar.addSubview(shouqiBtn)
        
        let item = UIBarButtonItem.init(customView: shouqiBtn)
        let flexItem = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let array = [flexItem,flexItem,item]
        bar.setItems(array, animated: true)
        self.inputAccessoryView = bar
    }
    
    @objc func onShouqiClick(view:UIButton) -> Void {
        self.resignFirstResponder()
    }
    
//    - (CGRect)leftViewRectForBounds:(CGRect)bounds
//    {
//    CGRect iconRect = [super leftViewRectForBounds:bounds];
//    iconRect.origin.x += 15; //像右边偏15
//    return iconRect;
//    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 10
        return rect
    }
}
