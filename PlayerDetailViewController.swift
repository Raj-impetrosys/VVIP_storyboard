//
//  PlayerDetailViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 22/07/21.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    @IBOutlet weak var h1: UIStackView!
    @IBOutlet weak var h2: UIStackView!
    @IBOutlet weak var h3: UIStackView!
    @IBOutlet weak var h4: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorders(stack: h1)
        addBorders(stack: h2)
        addBorders(stack: h3)
        addBorders(stack: h4)
//        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    func addBorders(stack: UIStackView){
//        stack.frame.width. = 200
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.white.cgColor
        stack.layer.cornerRadius = 8
//        stack.setCustomSpacing(10, after: stack.subviews[0])
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
