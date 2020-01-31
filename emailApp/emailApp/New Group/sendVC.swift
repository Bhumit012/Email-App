//
//  sendVC.swift
//  emailApp
//
//  Created by Bhumit Muchhadia on 2020-01-31.
//  Copyright © 2020 Bhumit Muchhadia. All rights reserved.
//

import UIKit

class sendVC: UIViewController {
    var dataAPIObj = DataAPI()
    var emailDict:[[String:String]] = [[:]]
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        // load dummy data
        emailDict = dataAPIObj.fetchData(key: "SentKey")
        tbl.reloadData()
    }
    @IBAction func deleteBtn(_ sender: UIButton) {
        dataAPIObj.DeleteEmail(key:"SentKey", name:emailDict[sender.tag]["name"]!, subject:emailDict[sender.tag]["subject"]!)
        emailDict = dataAPIObj.fetchData(key: "SentKey")
        tbl.reloadData()
    }
    
}

extension sendVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushClass = self.storyboard?.instantiateViewController(withIdentifier: "emailID") as! EmailMainViewController
        pushClass.isCompose = false
        pushClass.email = emailDict[indexPath.row];
        self.navigationController!.pushViewController(pushClass, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if emailDict.count == 0 {
            return 0
        }
        else{
            return emailDict.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell1")! as! TableViewCell
        cell.deleteBtn.tag = indexPath.row
        cell.namelbl.text =  emailDict[indexPath.row]["name"]
        cell.titleLbl.text =  emailDict[indexPath.row]["subject"]
        cell.selectionStyle = .none
        return cell;
    }
}

