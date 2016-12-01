//
//  DelegateVc.swift
//  StudyDemo
//
//  Created by 赵城林 on 16/12/1.
//  Copyright © 2016年 com.hillhouse.news. All rights reserved.
//

import UIKit

//声明代理方法
protocol valueChanedDelegate {
    func valueClicked(string:String)
}
//重命名一个闭包
typealias sendValue = (_ string:String) -> Void


class DelegateVc: UIViewController {
    
    
    //设置代理属性,必须设置为nil
    var delegate :valueChanedDelegate? = nil
    //创建一个闭包属性
    var sendValueSure : sendValue?
    //属性传值
    var string:String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton.init(type: .custom);
        button.frame = CGRect(x:64,y:64,width:100,height:50)
        button.backgroundColor = UIColor.red;
        button .setTitleColor(UIColor.white, for: .normal)
        button.title(for: .normal)
        button .setTitle("我是处罚代理", for: .normal)
        button .addTarget(self, action: #selector(senderAction(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        //属性传值演示打印
        print(string);
        
    }
    
    //触发代理方法
    func senderAction(_ sender:UIButton){
        
        self.delegate?.valueClicked(string: "我要爆发")
        self.sendValueSure! ("我是一个闭包传值")
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
