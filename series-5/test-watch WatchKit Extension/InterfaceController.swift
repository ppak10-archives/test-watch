	//
//  InterfaceController.swift
//  test-watch WatchKit Extension
//
//  Created by Peter Pak on 9/16/19.
//  Copyright © 2019 Peter Pak. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    let tableData = ["One", "Two", "Three", "Four", "Five", "Six"]
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTableData()
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    private func loadTableData() {
        if tableView != nil {
            tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
            for (index, rowModel) in tableData.enumerated() {
                if let rowController = tableView.rowController(at: index) as? RowController {
                    rowController.rowLabel.setText(rowModel)
                }
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "DetailInterfaceController", context: tableData[rowIndex])
    }
    
}
