//
//  AddUserViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 20/07/21.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var deleteBtn: UIImageView!
    @IBOutlet weak var likeBtn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfig()
//        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
    
    func btnConfig(){
        
        addShadow(myImage: deleteBtn)
        addShadow(myImage: likeBtn)
        let tapdidTapdeleteBtn = UITapGestureRecognizer(target: self, action: #selector(didTapdeleteBtn(_:)))
            // Add Tap Gesture Recognizer
        let tapdidTaplikeBtn = UITapGestureRecognizer(target: self, action: #selector(didTaplikeBtn(_:)))
            // Add Tap Gesture Recognizer
        deleteBtn.addGestureRecognizer(tapdidTapdeleteBtn)
        likeBtn.addGestureRecognizer(tapdidTaplikeBtn)

    }
    
    func addShadow(myImage: UIImageView){
        myImage.layer.shadowColor = UIColor.gray.cgColor
        myImage.layer.shadowOpacity = 0.8
            myImage.layer.shadowOffset = CGSize.zero
            myImage.layer.shadowRadius = 15
//            myImage.layer.shadowPath = UIBezierPath(rect: myImage.bounds).cgPath
            myImage.layer.shouldRasterize = false
//            myImage.layer.cornerRadius = 50
            myImage.clipsToBounds = false
    }
    
    @objc private func didTapdeleteBtn(_ sender: UITapGestureRecognizer) {
        print("close button tapped")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc private func didTaplikeBtn(_ sender: UITapGestureRecognizer) {
        print("like button tapped")
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
