//
//  CheckBox.swift
//  ToDoApp
//
//  Created by 張翔 on 2021/06/14.
//

import UIKit

class CheckBox: UIButton {
    
    // 何番目のCellのCheckBoxかを記録するための変数
    var index: Int!
    
    let saveData = UserDefaults.standard
    
    // Images
    let checkedImage = UIImage(named: "checked.png")! as UIImage
    let uncheckedImage = UIImage(named: "unchekedbox.png")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
                
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
        
        // UserDefaultsからデータを取得
        var todoArray = saveData.array(forKey: "TODO") as! [Dictionary<String, String>]
        
        // チェックされているかどうかを反転させる
        if todoArray[index]["Checked"] == "YES" {
            todoArray[index]["Checked"] = "NO"
        } else {
            todoArray[index]["Checked"] = "YES"
        }
        
        // UserDefautlsに上書き
        saveData.setValue(todoArray, forKey: "TODO")
        
    }
}
