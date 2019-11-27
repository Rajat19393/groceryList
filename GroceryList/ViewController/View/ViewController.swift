//
//  ViewController.swift
//  GroceryList
//
//  Created by Rajat on 27/11/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTotalCost: UILabel!
    @IBOutlet weak var tableGroceryList: UITableView!
    @IBAction func buttonSubmitTapped(_ sender: Any) {
        viewModel.consoleData()
    }
    var viewModel : MVViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MVViewController()
        viewModel.delegate = self
        DispatchQueue.main.async {
            self.tableGroceryList.dataSource = self
            self.tableGroceryList.reloadData()
        }
        // Do any additional setup after loading the view.
    }


}
extension ViewController : MVViewControllerDelegate {
    func setTotalCost(_ totalCost: Int) {
        self.labelTotalCost.text = "\(totalCost)"
    }
}
extension ViewController : AddCellDelegate {
    func AddEmptyModel() {
        self.viewModel.AddNewData()
        self.view.endEditing(true)
        self.tableGroceryList.reloadData()
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.tableCellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == viewModel.listCount {
           let addCell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddCell
            addCell.delegate = self
            return addCell
        } else {
            let groceryCell = tableView.dequeueReusableCell(withIdentifier: "GroceryCell", for: indexPath) as! GroceryCell
            groceryCell.viewModel = viewModel.viewModel(at: indexPath.row)
            groceryCell.index = indexPath.row
            groceryCell.textFieldCost.delegate = self
            groceryCell.textFieldTitle.delegate = self
            return groceryCell
        }
    }
}
extension ViewController : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            if textField.tag.isMultiple(of: 2) {
                print("title \(updatedText)")
                viewModel.changeName(textField.tag/2, updatedText)
            } else {
                    print("cost \(updatedText)")
                    viewModel.changeCost(textField.tag/2, Int(updatedText) ?? 0)
                }
        }
        return true
    }
}
