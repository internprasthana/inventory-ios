//
//  TableViewCell.swift
//  InventoryManagement
//
//  Created by Manisha on 10/08/22.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject{
    func didTapButton(with title: String)
}

class TableViewCell: UITableViewCell {

    weak var delegate: MyTableViewCellDelegate?
    
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empid: UILabel!
    @IBOutlet weak var emprole: UILabel!
    
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var named: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imagedevice: UIImageView!
    @IBOutlet weak var deviceId: UILabel!
    private var title : String = ""
    
    @IBAction func buttonPress(_ sender: UIButton) {
        delegate?.didTapButton(with: title)
        
        
    }
    
    func configure(with title: String){
        self.title = title
        button.setTitle(title, for: .normal)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
