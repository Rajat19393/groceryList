//
//  MVViewController.swift
//  GroceryList
//
//  Created by Rajat on 27/11/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import Foundation

protocol MVViewControllerDelegate : class{
    func setTotalCost(_ totalCost : Int)
}

class MVViewController {
    var groceryListArray = [MViewController]()
    weak var delegate : MVViewControllerDelegate?
    var listCount : Int {
        return groceryListArray.count
    }
    var tableCellsCount : Int {
        return groceryListArray.count + 1
    }
    
    func AddNewData() {
        groceryListArray.append(MViewController(title: "", cost: 0))
    }
    func changeName(_ index : Int ,_ title : String) {
        groceryListArray[index].title = title
    }
    func viewModel(at index : Int) -> MViewController {
        return groceryListArray[index]
    }
    func changeCost(_ index : Int,_ latestCost : Int) {
        self.groceryListArray[index].cost = latestCost
        var sum = 0
        for items in self.groceryListArray {
            sum += items.cost
        }
        self.delegate?.setTotalCost(sum)
    }
    func consoleData() {
        for items in self.groceryListArray {
            print("title: \(items.title) cost : \(items.cost)")
        }
    }
}
