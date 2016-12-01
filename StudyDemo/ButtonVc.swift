//
//  ButtonVc.swift
//  StudyDemo
//
//  Created by 赵城林 on 16/12/1.
//  Copyright © 2016年 com.hillhouse.news. All rights reserved.
//

import UIKit

//遵守代理 valueChanedDelegate
class ButtonVc: UIViewController ,valueChanedDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.edgesForExtendedLayout = .top
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x:10,y:20,width:100,height:200)
        button.setTitle("普通状态", for:.normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(tapped(_:)), for: UIControlEvents.touchUpInside)
        

    }
    
    func tapped(_ sender:UIButton){
        sender.backgroundColor = UIColor.green;
        print("我是一个小小程序员 ");
        let vc  = DelegateVc()
        vc.delegate = self;
        vc.string = "我就是一个属性传值"
        //闭包传值
        vc.sendValueSure = {(string:String) ->Void in
        
            print(string);
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    //实现代理方法
    func valueClicked(string: String) {
        print(string);
        
    }

    //闭包反向传值
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
