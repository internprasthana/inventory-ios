//
//  EmployeeListViewController.swift
//  InventoryManagement
//
//  Created by Manisha on 09/08/22.
//

import UIKit

class EmployeeListViewController:UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    lazy var assignSheetVc = DeviceAssignViewController()
    
    
    @IBOutlet weak var segmentOut: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    var empData : [EmpDetails] = []
//    var filterData: [ EmpDetails] = []
    
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        if segmentOut.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "AddEmployee", sender: Self.self)
        } else {
            performSegue(withIdentifier: "AddDevice", sender: self.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        empData = [EmpDetails(name: "Sujith", empid: "h245j0", role: "Software Engineer", img: "icon"),
                   EmpDetails(name: "Manisha", empid: "gi48g", role: "Software Engineer", img: "icon"),
                   EmpDetails(name: "Pavani", empid: "3hj4b3", role: "Software Engineer", img: "icon" ),
                   EmpDetails(name: "Shivaani", empid: "3hj4b3", role: "Software Engineer", img: "icon" )]
//                filterData = empData
        
        
    }
  
   
    
    var deviceData : [DeviceDetails] = [DeviceDetails( img: "computermouse", deviceId: "hb45g",      deviceName: "Dell", assign: "Assign"),
                                        DeviceDetails( img: "laptopcomputer", deviceId: "gi86g", deviceName: "Macbook", assign: "notassigned"),
                                        DeviceDetails( img: "laptopcomputer", deviceId: "fy756j", deviceName: "MacBookPro", assign: "Assign")]
    
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
        switch segmentOut.selectedSegmentIndex {
        case 0:
            navigationItem.title = "EmployeeList"
        case 1:
            navigationItem.title = "DeviceList"
        default:
            break
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 0
        switch segmentOut.selectedSegmentIndex{
        case 0:
            value = empData.count
        case 1:
            value = deviceData.count
        default:
            break
        }
          return value

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewcell1", for: indexPath) as! TableViewCell
        switch segmentOut.selectedSegmentIndex{
        case 0:
            cell.empid.text = empData[indexPath.row].empid
            cell.empName.text = empData[indexPath.row].name
            cell.emprole.text = empData[indexPath.row].role
            cell.imagedevice.image = UIImage(named: empData[indexPath.row].img ?? "")

        case 1:
            dismiss(animated: true)
        default :
            break
        }
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewcell2", for: indexPath) as! TableViewCell
        switch segmentOut.selectedSegmentIndex{
        case 0:
            dismiss(animated: true)
        case 1:
            cell2.deviceId.text = deviceData[indexPath.row].deviceId
            cell2.deviceName.text = deviceData[indexPath.row].deviceName
            cell2.button.tag = indexPath.row
//            cell2.button.addTarget(self, action: #selector(addButton), for: .touchUpInside)
            cell2.configure(with: deviceData[indexPath.row].assign ?? "")
            cell2.delegate = self
        default :
            break
        }
        if segmentOut.selectedSegmentIndex == 0{
         return cell
        }
        else {
            return cell2
        }
    }
//    @objc func addButton(sender : UIButton){
//
//        let indexpath1 = IndexPath(row: sender.tag, section: 0)
//
//        if let sheet = assignSheetVc.sheetPresentationController{
//            sheet.detents = [.medium()]
//        }
//        self.present(assignSheetVc, animated: true, completion: nil)
//
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EmpDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployeeDetailsViewController{
            destination.emplyoyee = empData[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//            if searchText != ""
//            {
//                filterData = empData.filter({ $0.contains(searchText)
//
//                })
//            }
    }

}
extension EmployeeListViewController : MyTableViewCellDelegate {
    func didTapButton(with title: String) {
        if let sheet = assignSheetVc.sheetPresentationController{
                    sheet.detents = [.medium()]
                }
                self.present(assignSheetVc, animated: true, completion: nil)
        
        
    }
}
