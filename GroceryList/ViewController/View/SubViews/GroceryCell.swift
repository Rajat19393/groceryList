//
//  GroceryCell.swift
//  GroceryList
//
//  Created by Rajat on 27/11/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit

class GroceryCell: UITableViewCell {
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldCost: UITextField!
    
    var viewModel : MViewController? {
        didSet {
            if let data = self.viewModel {
                self.textFieldTitle.text = data.title
                self.textFieldCost.text = "\(data.cost)"
            }
        }
    }
    var index : Int? {
        didSet {
            if let tagNumber = self.index {
                self.textFieldTitle.tag = 2*tagNumber
                self.textFieldCost.tag = (2*tagNumber) + 1
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.textFieldTitle.text = ""
//        self.textFieldTitle.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
