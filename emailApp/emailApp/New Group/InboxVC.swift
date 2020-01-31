//
//  InboxVC.swift
//  emailApp
//
//  Created by Bhumit Muchhadia on 2020-01-31.
//  Copyright © 2020 Bhumit Muchhadia. All rights reserved.
//

import UIKit

class InboxVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var emailDict:[[String:String]] = [[:]]
    @IBOutlet weak var tbl: UITableView!
    var dataAPIObj = DataAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        // load dummy data
        emailDict = dataAPIObj.fetchData(key: "EmailList")
        tbl.reloadData()
    }
    
    @IBAction func archBtn(_ sender: UIButton) {
        dataAPIObj.addEmail(key:"archKey", name:emailDict[sender.tag]["name"]!, subject:emailDict[sender.tag]["subject"]!,body: emailDict[sender.tag]["body"]!)
        dataAPIObj.DeleteEmail(key:"EmailList", name:emailDict[sender.tag]["name"]!, subject:emailDict[sender.tag]["subject"]!)
        emailDict = dataAPIObj.fetchData(key: "EmailList")
        tbl.reloadData()
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        dataAPIObj.DeleteEmail(key:"EmailList", name:emailDict[sender.tag]["name"]!, subject:emailDict[sender.tag]["subject"]!)
        emailDict = dataAPIObj.fetchData(key: "EmailList")
        tbl.reloadData()
    }
    
}
extension InboxVC:UITableViewDelegate,UITableViewDataSource{
    
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
        return emailDict.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
        cell.archBtn.tag = indexPath.row
        cell.selectionStyle = .none
        cell.deleteBtn.tag = indexPath.row
        cell.namelbl.text =  emailDict[indexPath.row]["name"]
        cell.titleLbl.text =  emailDict[indexPath.row]["subject"]
        return cell;
    }
}
