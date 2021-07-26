//
//  TableViewController.swift
//  VVIP_storyboard
//
//  Created by mac on 20/07/21.
//

import UIKit
import SideMenu

protocol MenuControllerDelegate{
    func didSelectMenuItem(named: String)
}

class TableViewController: UITableViewController {
    
//    var items = [
//        "User list", "Ass server / players", "Notice notification", "Setting dial", "Payment", "Server records", "Delete data setting", "Reports"
//    ]
    
    var items = [
        Menu(image: "n-48", title: "User list"),
        Menu(image: "n1-48", title: "Add server / players"),
        Menu(image: "n2-48", title: "Notice Notification"),
        Menu(image: "n3-48", title: "Setting dial"),
        Menu(image: "n4-48", title: "Payment"),
        Menu(image: "n5-48", title: "Server records"),
        Menu(image: "n6-48", title: "Delete data setting"),
        Menu(image: "n7-48", title: "Reports"),
    ]
    
    var vc: UIViewController?
    
    struct Menu {
        let image: String
        let title: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewController")
        tableView.backgroundColor = UIColor(named: "AppBlue")
        tableView.rowHeight = 70
        tableView.isScrollEnabled = false
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 800
//        self.tableView.backgroundColor = UIColor.blue
//        tableView.tintColor = UIColor(named: "AppBlue")
//        tableView.layer.backgroundColor = CGColor(red: 0.5, green: 0.5, blue: 0.2, alpha: 1)
//        tableView.sectionIndexBackgroundColor = UIColor.systemGreen
    

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return items.count
//    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print("tapped: \(Int)")
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewController", for: indexPath)
//        if(cell.isSelected){
//            print("selected cell: \(indexPath.row)")
//        } else {
//            print("Still not selected")
//        }

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row].title
        cell.imageView?.image = UIImage(named: items[indexPath.row].image)
        cell.backgroundColor = UIColor(named: "AppBlue")
        cell.textLabel?.textColor = UIColor.white
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.lightText
        cell.selectedBackgroundView = bgColorView
        
//        let tap = UITapGestureRecognizer(target: self, action: Selector("SomeMethod"))
//        cell.addGestureRecognizer(tap){
//
//        }
    
//        cell.contentView.backgroundColor = UIColor(named: "AppBlue")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected item \(indexPath.row)")
        
         vc = storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        switch indexPath.row {
        case 0:
            vc = storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        case 1:
            vc = storyboard?.instantiateViewController(withIdentifier: "AddUserViewController") as! AddUserViewController
        case 3:
            vc = storyboard?.instantiateViewController(withIdentifier: "SettingDialViewController") as! SettingDialViewController
        default:
            vc = storyboard?.instantiateViewController(withIdentifier: "AddUserViewController") as! AddUserViewController
        }
        
        dismiss(animated: true, completion: nil)
//        let vc1 = storyboard?.instantiateViewController(withIdentifier: "AddUserViewController") as! vc
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
