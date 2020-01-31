//
//  EmailMainViewController.swift
//  emailApp
//
//  Created by Bhumit Muchhadia on 2020-01-31.
//  Copyright © 2020 Bhumit Muchhadia. All rights reserved.
//

import UIKit

class EmailMainViewController: UIViewController {
    
    var isCompose:Bool = true
      var dataAPIObj = DataAPI()
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var bodytxt: UITextView!
    @IBOutlet weak var btnSend: UIButton!
   
    var email:[String:String] = [:]
    @IBAction func btnSend(_ sender: Any) {
        
        if txtFieldName.text?.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "Please add name of person", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if (txtFeildSubj.text?.count == 0){
            let alert = UIAlertController(title: "Alert", message: "Please add Subject", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            dataAPIObj.addEmail(key: "SentKey", name: txtFieldName.text!, subject: txtFeildSubj.text!, body: bodytxt.text)
            
            _ = navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    @IBOutlet weak var btnSendClick: UIButton!
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFeildSubj: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!isCompose){
            btnSendClick.isHidden = true
            bodytxt.isUserInteractionEnabled = false
            txtFieldName.isUserInteractionEnabled = false
            txtFeildSubj.isUserInteractionEnabled = false
        }else{
            btnSendClick.isHidden = false
            bodytxt.isUserInteractionEnabled = true
            txtFieldName.isUserInteractionEnabled = true
            txtFeildSubj.isUserInteractionEnabled = true
        }
        // Do any additional setup after loading the view.
        self.txtFeildSubj.text = email["subject"]
        self.txtFieldName.text = email["name"]
        self.bodytxt.text = email["body"]
    }
    
    
}
