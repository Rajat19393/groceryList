//
//  AddCell.swift
//  GroceryList
//
//  Created by Rajat on 27/11/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit
protocol  AddCellDelegate : class {
    func AddEmptyModel()
}
class AddCell: UITableViewCell {
    
    @IBAction func buttonAddtapped(_ sender: Any) {
        delegate?.AddEmptyModel()
    }
    @IBOutlet weak var buttonAdd: UIButton!
    weak var delegate : AddCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
