//
//  DrawerViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 19/07/21.
//

import UIKit
import SideMenu

class DrawerViewController: UIViewController, UITextFieldDelegate {
//    var isOpen: Bool = false
    let menu = SideMenuNavigationController(rootViewController: TableViewController())
    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var hStackView: UIStackView!
    @IBOutlet weak var hStackView1: UIStackView!
    @IBOutlet weak var hStackView2: UIStackView!
    @IBOutlet weak var hStackView3: UIStackView!
    @IBOutlet weak var countPlayers: UILabel!
    @IBOutlet weak var countPlayers1: UILabel!
    @IBOutlet weak var countPlayers2: UILabel!
    @IBOutlet weak var countPlayers3: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addPlayerTap: UIButton!
    //    var vc: UIViewController = DrawerViewController()
//    var screen: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        searchBar.delegate = self
        sideMenuConfig()
        searchBarConfig()
        alertConfig()
        listConfig(stackView: hStackView, countPlay: countPlayers)
        listConfig(stackView: hStackView1, countPlay: countPlayers1)
        listConfig(stackView: hStackView2, countPlay: countPlayers2)
        listConfig(stackView: hStackView3, countPlay: countPlayers3)
        scrollViewConfig()
//        addChildController()
//        switch screen {
//        case 1: self.vc = AddUserViewController()
//        default: self.vc = DrawerViewController()
//
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        print("View appeared")
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        print("View Disappeared")
        super.viewWillDisappear(animated)
    } 
    
    @IBAction func addPlayerTapped(_ sender: Any) {
//        self.present(alert, animated: true, completion: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddUserViewController") as! AddUserViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func alertConfig(){
        alert.addChild(UIViewController())
        let margin:CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: alert.view.bounds.size.width/2, height: 50)
        let customView = UIView(frame: rect)
        customView.backgroundColor = .green
        alert.view.addSubview(AlertView())
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("error....")
            }
        }))
    }
    
    func scrollViewConfig(){
//        hStackView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.insertSubview(personImage, at: 1)
//        scrollView.insertSubview(personImage, at: 2)
//        scrollView.insertSubview(personImage, at: 3)
//        scrollView.addSubview(hStackView)
//        scrollView.addSubview(hStackView)
//        scrollView.addSubview(hStackView)
//        scrollView.insertSubview(personImage, at: 1)
//        view.addSubview(scrollView)
    }
    
    func listConfig(stackView: UIStackView, countPlay: UILabel){
        personImage.layer.cornerRadius = 50
        stackView.layer.cornerRadius = 20
        stackView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderWidth = 2

//        countPlayers.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
//        countPlayers.frame.size.width = 100
//        countPlayers.frame.size.height = 100
//        countPlayers.textAlignment = .center
        countPlay.layer.borderWidth = 2
        countPlay.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1)
        countPlay.layer.cornerRadius = 15
        countPlay.textAlignment = .center
        
        addGesture(stack: stackView)
    }
    
    func addGesture(stack: UIStackView){
        let tapdidTapUser = UITapGestureRecognizer(target: self, action: #selector(didTapUser(_:)))
        
        stack.addGestureRecognizer(tapdidTapUser)
    }
    
    @objc private func didTapUser(_ sender: UITapGestureRecognizer) {
        print("Navigated to user detail")
        let vc = storyboard?.instantiateViewController(withIdentifier: "PlayerDetailViewController") as! PlayerDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBarConfig(){
        searchBar.attributedPlaceholder = NSAttributedString(string:"Search here...",
                                                             attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)])
        searchBar.font = UIFont(name: "verdana", size: 16)
        searchBar.textColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    func sideMenuConfig(){
        SideMenuManager.default.leftMenuNavigationController = menu
        
//        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
////
//        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view)

        // (Optional) Prevent status bar area from turning black when menu appears:
        menu.statusBarEndAlpha = 0.0
        menu.alwaysAnimate = true
        menu.animationOptions = .curveEaseInOut
        menu.leftSide = true
//        menu.blurEffectStyle = .dark
//        menu.presentDuration = 1
        menu.setNavigationBarHidden(true, animated: true)
        menu.title = "Admin"
        menu.menuWidth = width * 0.6
        
        menu.view.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        menu.view.layer.shadowOpacity = 0.8
        menu.view.layer.shadowOffset = CGSize(width: 20, height: 20)
        menu.view.layer.shadowRadius = 20
        let shadowRect: CGRect = CGRect(x: -20, y: 20, width: 20, height: 20);  // inset top/bottom
        menu.view.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        
        self.view.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowOffset = CGSize(width: 20, height: 20)
        self.view.layer.shadowRadius = 20
        
    }
    
    func addChildController(){
//        addChild(DrawerViewController())
        addChild(AddUserViewController())
        
//        view.addSubview(DrawerViewController().view)
        view.addSubview(AddUserViewController().view)
        
//        DrawerViewController().view.frame = view.bounds
        AddUserViewController().view.frame = view.bounds
        
//        DrawerViewController().didMove(toParent: self)
        AddUserViewController().didMove(toParent: self)
        
        DrawerViewController().view.isHidden = true
        AddUserViewController().view.isHidden = false
    }
    
//    @IBAction func menuTap(_ sender: Any) {
////        isOpen ? dismiss(animated: true, completion: nil) :
//        if(!menu.isHidden){
//            dismiss(animated: true, completion: nil)
//        }
////        menu.dismissOnPresent = true
////        present(menu, animated: true, completion: nil)
////        print(isOpen)
////        isOpen.toggle()
//    }
    
//    @IBAction func menuBtnTapped(_ sender: Any) {
//        present(SideMenuNavigationController(rootViewController: TableViewController()), animated: true, completion: nil)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//class ScrollViewController: UIViewController {
//    @IBOutlet weak var scrollView: UIScrollView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let contentWidth = scrollView.bounds.width
//        let contentHeight = scrollView.bounds.height * 3
//        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
//
//        let subviewHeight = CGFloat(120)
//        var currentViewOffset = CGFloat(0);
//
//        while currentViewOffset < contentHeight {
//            let frame = CGRectMake(0, currentViewOffset, contentWidth, subviewHeight).rectByInsetting(dx: 5, dy: 5)
//            let hue = currentViewOffset/contentHeight
//            let subview = UIView(frame: frame)
//            subview.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
//            scrollView.addSubview(subview)
//
//            currentViewOffset += subviewHeight
//        }
//    }
//}

class AlertView: UIView {
    var label: UILabel = UILabel()
    var myNames = ["dipen","laxu","anis","aakash","santosh","raaa","ggdds","house"]

//    override init(){
//        super.init()
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomView() {
        label.frame = CGRect(x: 50, y: 10, width: 200, height: 100)
        label.backgroundColor=UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.text = "test label"
        label.isHidden=true
        self.addSubview(label)

        let btn: UIButton = UIButton()
        btn.frame=CGRect(x: 50, y: 120, width: 200, height: 100)
        btn.backgroundColor=UIColor.red
        btn.setTitle("button", for: UIControl.State.normal)
        btn.addTarget(self, action: Selector(("changeLabel")), for: UIControl.Event.touchUpInside)
        self.addSubview(btn)

        let txtField : UITextField = UITextField()
        txtField.frame = CGRect(x: 50, y: 250, width: 100,height: 50)
        txtField.backgroundColor = UIColor.gray
        self.addSubview(txtField)
    }
}
