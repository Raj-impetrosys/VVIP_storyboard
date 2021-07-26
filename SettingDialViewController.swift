//
//  SettingDialViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 23/07/21.
//

import UIKit

class SettingDialViewController: UIViewController {
    @IBOutlet weak var hStackView: UIStackView!
    @IBOutlet weak var hStackView1: UIStackView!
    @IBOutlet weak var hStackView2: UIStackView!
    @IBOutlet weak var hStackView3: UIStackView!
    @IBOutlet weak var hStackView4: UIStackView!
    @IBOutlet weak var hStackView5: UIStackView!
    @IBOutlet weak var hStackView6: UIStackView!
    @IBOutlet weak var hStackView7: UIStackView!
    
    @IBOutlet weak var viewScroll: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfig()
        gestureConfig()
//        hStackConfig()
//        tabViewConfig()
        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapContactBtn(_ sender: UITapGestureRecognizer) {
        print("Contact button tapped")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func gestureConfig(){
        let didTappedContactBtn = UITapGestureRecognizer(target: self, action: #selector(didTapContactBtn(_:)))
        hStackView.addGestureRecognizer(didTappedContactBtn)
//        hStackView1.addGestureRecognizer(didTappedContactBtn)
//        hStackView2.addGestureRecognizer(didTappedContactBtn)
//        hStackView3.addGestureRecognizer(didTappedContactBtn)
//        hStackView4.addGestureRecognizer(didTappedContactBtn)
//        hStackView5.addGestureRecognizer(didTappedContactBtn)
//        hStackView6.addGestureRecognizer(didTappedContactBtn)
//        hStackView7.addGestureRecognizer(didTappedContactBtn)

    }
    
//    func tabViewConfig(){
//
//    }

    func hStackConfig(){
//        hStackView.constraints = [NSLayoutConstraint()]
//        let frame = CGRect(x: 0,y: 10,width: 300,height: 100);
                //create a new UIView, use your own UIView subclass here if you have one
//                UIView *view = [[UIView alloc] initWithFrame:frame];
        hStackView.translatesAutoresizingMaskIntoConstraints = false
//        hStackView.frame = frame
        viewScroll.addConstraint(NSLayoutConstraint(item: hStackView!, attribute: .top, relatedBy: .equal, toItem: hStackView, attribute: .top, multiplier: 1, constant: 0))
        viewScroll.addSubview(hStackView)
    }
    
    func navigationConfig(){
        let person = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(personBtnTapped))
        let dots = UIBarButtonItem(image: UIImage(systemName: "ellipsis")?.rotate(radians: 1.5708), style: .plain, target: self, action: #selector(dotsBtnTapped))

        navigationItem.rightBarButtonItems = [dots, person]
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
//        navigationController?.navigationBar.backgroundColor = UIColor.yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavColor")
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = UIColor.clear
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.isTranslucent = true
        super.viewWillDisappear(animated)
    }
    
    @objc private func personBtnTapped(_ sender: UITapGestureRecognizer) {
        print("person button tapped")
    }

    @objc private func dotsBtnTapped(_ sender: UITapGestureRecognizer) {
        print("dots button tapped")
//        let vc = storyboard?.instantiateViewController(identifier: "scrollview")
//        self.navigationController?.pushViewController(vc!, animated: true)
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
