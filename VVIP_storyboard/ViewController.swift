//
//  ViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 17/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var IdField: UITextField!
    @IBOutlet weak var PwdField: UITextField!
    var text:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfig()
        IdField.delegate = self
        PwdField.delegate = self
        IdField.placeholder = "Enter your ID"
        IdField.textColor = UIColor.white
        IdField.font = UIFont(name: "verdana", size: 20)
        PwdField.placeholder = "Enter your ID"
        PwdField.textColor = UIColor.white
        PwdField.font = UIFont(name: "verdana", size: 20)
        IdField.attributedPlaceholder = NSAttributedString(string:"Enter your ID",
                                                           attributes:[NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        PwdField.attributedPlaceholder = NSAttributedString(string:"Enter your Password",
                                                            attributes:[NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
    }
    
    func navigationConfig(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    @IBAction func EnterTapped(_ sender: Any) {
        print("Navigated")
//        TextView.text = "Username: \(UserNameField.text!)\nPassword: \(PasswordField.text!)"
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as? DrawerViewController
        
//        vc?.text = IdField.text ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        IdField.resignFirstResponder()
        PwdField.resignFirstResponder()
    }
}


