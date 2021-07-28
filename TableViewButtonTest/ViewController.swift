//
//  ViewController.swift
//  TableViewButtonTest
//
//  Created by クワシマ・ユウキ on 2021/07/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    // TableViewに表示するテキストの配列
    let items = ["test", "yuruyuru", "aaa"]
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        // cellのテキストを表示する部分の幅を、画面幅の80%の幅にする
        cell?.textLabel?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width * 0.8, height: (cell?.frame.height)!)
        //cellのテキストを表示する部分にアイテムを表示
        cell?.textLabel?.text = items[indexPath.row]
        
        //ボタンを作成
        let button = UIButton()
        //ボタンのx座標を画面幅の80%、ボタンの幅を画面幅の20%、ボタンの高さをcellの高さに合わせる
        button.frame = CGRect(x: tableView.frame.width * 0.8, y: 0, width: tableView.frame.width * 0.2, height: (cell?.frame.height)!)
        //ボタンにタイトルをセットする
        button.setTitle("X", for: .normal)
        //ボタンの色を設定
        button.setTitleColor(.black, for: .normal)
        //ボタンがタップされた時に呼ばれるメソッドを指定
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        //cellにボタンを追加する
        cell?.addSubview(button)
        
        return cell!
    }
    
    //ボタンがタッチされた時に呼ばれるメソッド
    @objc func buttonTapped(_ sender: UIButton) {
        //押されたボタンのタイトルを"O"にする
        sender.setTitle("O", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


}

