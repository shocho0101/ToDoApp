//
//  ListTableViewController.swift
//  ToDoApp
//
//  Created by 張翔 on 2021/06/14.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var todoArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard
    
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UserDefaultsにデータがあるなら
        if saveData.array(forKey: "TODO") != nil{
            // データを取得
            todoArray = saveData.array(forKey: "TODO") as! [Dictionary<String,String>]
        }
        // tableViewを更新
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoTableViewCell
        
        // cellのnameLabelに文字を表示
        cell.nameLabel.text = todoArray[indexPath.row]["Name"]
        // cellのCheckBoxに何番目のCellに表示されているCheckBoxであるかを知らせる
        cell.checkBox.index = indexPath.row
        
        // cellのCheckBoxのチェックがついているかどうかを設定
        if todoArray[indexPath.row]["Checked"] == "YES" {
            cell.checkBox.isChecked = true
        } else {
            cell.checkBox.isChecked = false
        }
        
        return cell
    }

    // TableViewのCellがタップされたら呼ばれるメソッド
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ここではどのCellがタップされたかをindexPath.rowで取得することができる。一番上のCellがタップされたらindexPath.rowは0、その次のCellがタップされたらindexPath.rowは1になる
        // TableViewではUserDefaultsに保存されているデータを上から表示しているので何番目のCellがタップされたかがそのまま何番目のデータを次の画面で表示すればいいのかにあたる
    
        // Cellの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        index = indexPath.row
        
        // 詳細画面に遷移する
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    // 詳細画面に遷移する直前に実行されるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 詳細画面を取得
        let detailViewController = segue.destination as! DetailViewController
        // 詳細画面にどのCellがタップされたかを教える
        detailViewController.index = index!
    }

}
