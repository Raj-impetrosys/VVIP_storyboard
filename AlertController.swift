//
//  AlertController.swift
//  VVIP_storyboard
//
//  Created by mac on 21/07/21.
//

import UIKit

class AlertController: UIAlertController {
    var alert = UIAlertController()

    override func viewDidLoad() {
        super.viewDidLoad()
         alert = UIAlertController(title: "What's your name?", message: "this is my alert", preferredStyle: .alert)
        alertConfig()
        // Do any additional setup after loading the view.
    }
    
    func alertConfig(){
        alert.title = "Alert"
        alert.message = "this is my alert"
//        alert.actions = "Actio"
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

            if let name = self.alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
        }))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
