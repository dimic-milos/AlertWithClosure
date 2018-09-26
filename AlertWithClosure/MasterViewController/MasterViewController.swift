//
//  MasterViewController.swift
//  AlertWithClosure
//
//  Created by Milos Dimic on 9/26/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var labelMain: UILabel!
    
    // MARK: Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func showPasswordInputDialog(withAction action: @escaping (String?) -> ()) {
        let alertController = UIAlertController(title: "Password required", message: "Please enter your password", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            action(alertController.textFields?.first?.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter password here"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Action methods
    
    @IBAction func buttonMainTapped(_ sender: UIButton) {
        showPasswordInputDialog { [weak self] (password) in
            self?.labelMain.text = password
        }
    }
}
