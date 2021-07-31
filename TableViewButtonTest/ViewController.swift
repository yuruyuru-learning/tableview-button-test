//
//  ViewController.swift
//  TableViewButtonTest
//
//  Created by クワシマ・ユウキ on 2021/07/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let items = ["test", "yuruyuru", "aaa"]
    
    let saveData = UserDefaults.standard
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width * 0.8, height: (cell?.frame.height)!)
        cell?.textLabel?.text = items[indexPath.row]
        
        for v in cell!.subviews {
            if let v = v as? UIButton {
                v.removeFromSuperview()
            }
        }
        
        let button = UIButton()
        button.frame = CGRect(x: tableView.frame.width * 0.8, y: 0, width: tableView.frame.width * 0.2, height: (cell?.frame.height)!)
        
        var count = 0
        
        if saveData.integer(forKey: items[indexPath.row]) != nil {
            count = saveData.integer(forKey: items[indexPath.row])
        } else {
            saveData.setValue(count, forKey: items[indexPath.row])
        }
        
        if count % 2 == 0 {
            button.setTitle("X", for: .normal)
        } else {
            button.setTitle("O", for: .normal)
        }
        
        button.tag = indexPath.row
        
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell?.addSubview(button)
        
        return cell!
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let count = saveData.integer(forKey: items[sender.tag])
        saveData.setValue(count + 1, forKey: items[sender.tag])
        self.table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


}

