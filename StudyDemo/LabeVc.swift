//
//  LabeVc.swift
//  StudyDemo
//
//  Created by 赵城林 on 16/12/1.
//  Copyright © 2016年 com.hillhouse.news. All rights reserved.
//

import UIKit

class LabeVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label = UILabel.init()
        label.frame = CGRect(x:64,y:64,width:100,height:100)
        label.backgroundColor = UIColor.green
        label.text = "我是一个爱好学习的人"
        label.shadowColor = UIColor.red
        label.shadowOffset = CGSize(width:20,height:10);
        self.view.addSubview(label);

//        let attrbute = NSMutableAttributedString.init(string:"我是一个小小程序猿")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
