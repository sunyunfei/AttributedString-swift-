//
//  ViewController.swift
//  AttributedString
//
//  Created by 孙云 on 15/12/31.
//  Copyright © 2015年 haidai. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据
        loadFWB()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     加载数据方法
     */
    func loadFWB(){
    
       //首先创建一个用于显示的uitextview
        var textView:UITextView!
        textView = UITextView(frame: CGRectMake(0, 100, self.view.frame.size.width, 300))
        textView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(textView)
/*------------------------------------------------------------------------------*/
        //NSAttributedString
        //第一种创建方法
        var str1:NSAttributedString!
        str1 = NSAttributedString.init(string: "某农场爆发疯牛病，一女记者闻讯赶到，采访农场主：“请问这疯牛病是从何而来的“你想想，每天都有人来捏你的XX，但是又不和你做ai，你会不会疯掉“")
        textView.attributedText = str1
        
        //第二种创建方法
        var str2:NSAttributedString!
        str2 = NSAttributedString.init(string: "某农场爆发疯牛病，一女记者闻讯赶到，采访农场主：“请问这疯牛病是从何而来的“你想想，每天都有人来捏你的XX，但是又不和你做ai，你会不会疯掉“", attributes: [NSForegroundColorAttributeName:UIColor.redColor()])
        textView.attributedText = str2
        
        // 第三种创建方法
        var str3:NSAttributedString!
        str3 = NSAttributedString.init(attributedString: str1)
        textView.attributedText = str3
        
        //判断两个字符串是否相等 
        let flag:Bool = (str1 .isEqualToAttributedString(str3))
        print("result:\(flag)")//result = true
        
        let flag2:Bool = (str2 .isEqualToAttributedString(str3))
        print("result:\(flag2)")//result = flase
        
        //截取字符串
        var str4:NSAttributedString!
        str4 = (str3 .attributedSubstringFromRange(NSMakeRange(0, 10)))
        textView.attributedText = str4
/*------------------------------------------------------------------------------*/
        //NSMutableAttributedString
        //创建
        var mustr1:NSMutableAttributedString!
        mustr1 = NSMutableAttributedString.init(string: "某农场爆发疯牛病，一女记者闻讯赶到，采访农场主：“请问这疯牛病是从何而来的“你想想，每天都有人来捏你的XX，但是又不和你做ai，你会不会疯掉“")
        //内容替换
        mustr1 .replaceCharactersInRange(NSMakeRange(0, 10), withString: "ni hao")
        textView.attributedText = mustr1
        
        //插入内容，必须富文本 
        mustr1 .insertAttributedString(str4, atIndex: 0)
        textView.attributedText = mustr1
        
        //追加
        mustr1 .appendAttributedString(str3)
        textView.attributedText = mustr1
        
        //删除内容
        mustr1 .deleteCharactersInRange(NSMakeRange(0, 50))
        textView.attributedText = mustr1
        
        //重新付值
        mustr1 .setAttributedString(str2)
        textView.attributedText = mustr1
        
        //设置属性
        //颜色
        mustr1 .addAttribute(NSForegroundColorAttributeName, value: UIColor.yellowColor(), range: NSMakeRange(0, 6))
        textView.attributedText = mustr1
        //字体大小
        mustr1 .addAttribute(NSFontAttributeName, value:UIFont.systemFontOfSize(15.0), range: NSMakeRange(0,mustr1.length))
        textView.attributedText = mustr1
        
        //背景色
        mustr1 .addAttribute(NSBackgroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(3, 10))
        textView.attributedText = mustr1
        
        //下划线
        mustr1 .addAttribute(NSUnderlineStyleAttributeName, value: (1), range: NSMakeRange(1,10))
        textView.attributedText = mustr1
        //下划线颜色
        mustr1 .addAttribute(NSUnderlineColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(1, 8))
        textView.attributedText = mustr1
        
        //删除线
        mustr1 .addAttribute(NSStrikethroughStyleAttributeName, value: (1), range: NSMakeRange(10,10))
        textView.attributedText = mustr1
        
        //边线
        mustr1 .addAttribute(NSStrokeWidthAttributeName, value: (2), range: NSMakeRange(15, 20))
        textView.attributedText = mustr1
        
        //边线颜色(有了边线才会有作用)
        mustr1 .addAttribute(NSStrokeColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, 20))
        textView.attributedText = mustr1
        
        //阴影
        var shadow:NSShadow!
        shadow = NSShadow.init()
        shadow.shadowColor = UIColor.whiteColor()
        shadow.shadowOffset = CGSizeMake(1.0, 2.0)
        mustr1 .addAttribute(NSShadowAttributeName, value: shadow, range: NSMakeRange(0, 40))
        textView.attributedText = mustr1
        
        //多个属性一起加载
        mustr1 .addAttributes([NSForegroundColorAttributeName:UIColor.yellowColor(),NSBackgroundColorAttributeName:UIColor.blackColor()], range: NSMakeRange(0, mustr1.length))
        textView.attributedText = mustr1
        
        //移除属性
        mustr1 .removeAttribute(NSForegroundColorAttributeName, range: NSMakeRange(0, mustr1.length))
        textView.attributedText = mustr1
        
        //插入图片
        var attchment:NSTextAttachment!
        attchment = NSTextAttachment.init()
        attchment.image = UIImage(named:"share.jpg")
        var mustr2:NSAttributedString!
        mustr2 = NSAttributedString(attachment: attchment)
        mustr1 .insertAttributedString(mustr2, atIndex: 10)
        textView.attributedText = mustr1
        
        //图片大小随之改变
        var syfAttchment:SYFTextAttachment!
        syfAttchment = SYFTextAttachment.init()
        syfAttchment.image = UIImage(named: "share.jpg")
        var mustr3:NSAttributedString!
        mustr3 = NSAttributedString(attachment: syfAttchment)
        mustr1 .insertAttributedString(mustr3, atIndex: 2)
        textView.attributedText = mustr1
    }
}

