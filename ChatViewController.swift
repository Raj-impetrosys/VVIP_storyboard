//
//  ChatViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 26/07/21.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfig()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavColor")
//        let bounds = self.navigationController!.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 200.0)
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavColor")
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = UIColor.clear
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.isTranslucent = true
        super.viewWillDisappear(animated)
    }
    
    func navigationConfig(){
        let video = UIBarButtonItem(image: UIImage(systemName: "video.fill"), style: .plain, target: self, action: #selector(videoBtnTapped))
        let phone = UIBarButtonItem(image: UIImage(systemName: "phone.fill"), style: .plain, target: self, action: #selector(phoneBtnTapped))
        let dots = UIBarButtonItem(image: UIImage(systemName: "ellipsis")?.rotate(radians: 1.5708), style: .plain, target: self, action: #selector(dotsBtnTapped))

        navigationItem.rightBarButtonItems = [dots, phone, video]
        let customTitleView = UIView()
//        customTitleView.backgroundColor = .red
        customTitleView.layer.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        
        let onlineView = UIView()
        onlineView.backgroundColor = .green
        onlineView.frame = CGRect(x: 30, y: 0, width: 10, height: 10)
        onlineView.layer.cornerRadius = onlineView.frame.height/2
        
        let logo = UIImage(named: "person")
        let imageView = UIImageView(image:logo)
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
//        imageView.center = imageView.superview!.center;
        
        let title = UILabel()
        title.text = "Blair Dota"
        title.textColor = .white
        title.frame = CGRect(x: 55, y: 0, width: 200, height: 20)
        title.textAlignment = NSTextAlignment.left
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        
        let subtitle = UILabel()
        subtitle.text = "Online"
        subtitle.textColor = .white
        subtitle.frame = CGRect(x: 55, y: 20, width: 200, height: 20)
        subtitle.textAlignment = NSTextAlignment.left
        subtitle.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        customTitleView.addSubview(imageView)
        customTitleView.addSubview(title)
        customTitleView.addSubview(subtitle)
        customTitleView.addSubview(onlineView)
        self.navigationItem.titleView = customTitleView
//        self.navigationItem.titleView?.layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        navigationItem.backButtonDisplayMode = .generic
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
//        navigationController?.navigationBar.backgroundColor = UIColor.yellow
    }
    
    @objc private func videoBtnTapped(_ sender: UITapGestureRecognizer) {
        print("video button tapped")
    }
    
    @objc private func phoneBtnTapped(_ sender: UITapGestureRecognizer) {
        print("phone button tapped")
    }
    
    @objc private func dotsBtnTapped(_ sender: UITapGestureRecognizer) {
        print("dots button tapped")
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
