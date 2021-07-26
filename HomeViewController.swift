//
//  HomeViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 17/07/21.
//

import UIKit
//import SideMenu

class HomeViewController: UIViewController {
    var text: String = ""
    var isOpen:Bool = false
//    let menu = SideMenuNavigationController(rootViewController: YourViewController)
//    present(menu, animated: true, completion: nil)
    
//    @IBOutlet weak var leading: NSLayoutConstraint!
//    @IBOutlet weak var trailing: NSLayoutConstraint!
//    @IBOutlet weak var top: NSLayoutConstraint!
//    @IBOutlet weak var bottom: NSLayoutConstraint!
//    @IBOutlet weak var sview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func toggleDrawer(){
//        self.leading.constant = isOpen ? 0 : 300
//        self.trailing.constant = 0
//        self.top.constant = 0
//        self.bottom.constant = 0
//        self.sview.transform = CGAffineTransform(scaleX: isOpen ? 1 :0.9, y: isOpen ? 1 :0.8)
//                self.sview.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        self.isOpen.toggle()
        print("is open: \(isOpen)")
//        sview.addConstraint(NSLayoutConstraint())
    }
    
    @IBAction func menuTap(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: toggleDrawer)
//        toggleDrawer()
//        if(isOpen){
//            UIView.animate(withDuration: 1, animations: {
//                self.leading.constant = 0
//                self.trailing.constant = 0
//                self.top.constant = 0
//                self.bottom.constant = 0
//    //            screen.transform = CGAffineTransform(scaleX: 1, y: 1)
//                self.sview.transform = CGAffineTransform(scaleX: 1, y: 1)
////                self.sview.transform = CGAffineTransform(a: 0, b: 0, c: 0, d: 0, tx: 0, ty: 0)
//                self.isOpen = false
//                print("closed")
//            })
//
//        } else {
//            UIView.animate(withDuration: 1.5, animations: {
//                self.leading.constant = 300
//                self.trailing.constant = 0
//                self.top.constant = 0
//                self.bottom.constant = 0
//                self.sview.transform = CGAffineTransform(scaleX: 0.9, y: 0.8)
////                self.sview.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
//                self.isOpen = true
//                print("opened")
//            })
//
////            print(UIOffset.init(horizontal: 100, vertical: 20))
////            screen.transform = CGAffineTransform(scaleX: 2, y: 2)
//
//        }
        

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
