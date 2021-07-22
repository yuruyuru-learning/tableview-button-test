//
//  ViewController.swift
//  TableViewButtonTest
//
//  Created by クワシマ・ユウキ on 2021/07/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
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
        cell?.textLabel?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width * 0.8, height: (cell?.frame.height)!)
        cell?.textLabel?.text = items[indexPath.row]
        
        let button = UIButton()
        button.frame = CGRect(x: tableView.frame.width * 0.8, y: 0, width: tableView.frame.width * 0.2, height: (cell?.frame.height)!)
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell?.addSubview(button)
        
        return cell!
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        sender.setTitle("O", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


}

