//
//  AddViewController.swift
//  ToDoApp
//
//  Created by 張翔 on 2021/06/14.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var detailTextField: UITextField!
    
    let saveData = UserDefaults.standard
    var todoArray: [Dictionary<String, String>] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func save() {
        // 新しく保存するデータを作る。最初はチェックされていない状態なので、CheckedはNoとして登録しておく
        let taskDictionary = ["Name": nameTextField.text!, "Detail": detailTextField.text!, "Checked": "No"]
        
        // UserDefaultsにすでに保存されているデータがあったら(if)
        if saveData.array(forKey: "TODO") != nil {
            // データを取得してtodoArrayに代入する
            todoArray = saveData.array(forKey: "TODO") as! [Dictionary<String, String>]
        }
        // todoArrayに新しく保存するデータを追加
        todoArray.append(taskDictionary)
        
        // UserDefaultsに保存されているデータを上書きする
        saveData.set(todoArray, forKey: "TODO")
        
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }

}
