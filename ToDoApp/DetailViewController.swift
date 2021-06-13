//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by 張翔 on 2021/06/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    // ListTableViewControllerから何番目のCellがタップされたかを教えてもらうための変数
    var index: Int!
    
    let saveData = UserDefaults.standard
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // UserDefaultsからデータを取得
        let todoArray = saveData.array(forKey: "TODO") as! [Dictionary<String, String>]
        
        // Labelにindex番目=タップされたCell番目のデータを表示
        nameLabel.text = todoArray[index]["Name"]
        detailLabel.text = todoArray[index]["Detail"]
    }
    

   

}
