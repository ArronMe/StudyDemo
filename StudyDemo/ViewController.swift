//
//  ViewController.swift
//  StudyDemo
//
//  Created by 赵城林 on 16/11/30.
//  Copyright © 2016年 com.hillhouse.news. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    var ctrlNames :[NSDictionary]?
    var tableView :UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
    //构造数据源
        self.ctrlNames = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "Controls", ofType: "plist")!)as?Array
        //创建表视图
        self.tableView = UITableView.init(frame: self.view.frame, style: .plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "identCell");
        self.view.addSubview(self.tableView!)
        //创建表头视图
        let newFrame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:30)
        let newLabel = UILabel.init(frame: newFrame)
        newLabel.backgroundColor = UIColor.blue
        newLabel.textColor = UIColor.white;
        newLabel.text = "常见 UIKit 控件"
        newLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView!.tableHeaderView = newLabel;
        
    }
    
    //几个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    //每个分区多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlNames!.count;
    }
    //返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident:String = "identCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath);
        let dic = self.ctrlNames![indexPath.row]
        cell.textLabel!.text = dic.object(forKey:"title") as! String?
        cell.accessoryType = .checkmark
        return cell
    }
    
    //选中cell某一行的方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let tempString:String = self.ctrlNames![indexPath.row]
//        let alert = UIAlertController.init(title:"提示", message: "你选中了[\(tempString)]", preferredStyle:.alert)
//        let alertAction = UIAlertAction.init(title: "确认", style: .default, handler: nil)
//        alert.addAction(alertAction);`
//        self.present(alert, animated: true) { 
//            
//        }
        
        let tempDic:NSDictionary = self.ctrlNames![indexPath.row]
        let vcString = tempDic.object(forKey:"vc")as! String?
        
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
        guard let ns = nameSpace as? String else{
            return
        }
        
        let myClass: AnyClass? = NSClassFromString(ns + "." + vcString!)
        guard let myClassType = myClass as? UIViewController.Type else{                return
        }
        let myVC = myClassType.init()
        self .navigationController?.pushViewController(myVC, animated: true)
        

        
    }
    
    //滑动删除必须实现的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let index  = indexPath.row;
        self.ctrlNames!.remove(at: index);
        self.tableView?.deleteRows(at: [indexPath], with: .top);
    }
    //滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)
        -> UITableViewCellEditingStyle {
            return UITableViewCellEditingStyle.delete
    }
    
    //修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt
        indexPath: IndexPath) -> String? {
        return "删"
    }
    func firstAction()
    {
        print("你好啊");
    };
    
    
    func tapped(_ sender:UIButton){
        sender.backgroundColor = UIColor.green;
        print("我是一个小小程序员 ");
    
    }
    
//    func tapped(){
//        print("mmmm");
//        
//    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

