//
//  HomeViewController.swift
//  FourPay
//
//  Created by user212294 on 1/12/22.
//

import UIKit
import CoreData
//import SwiftUI

class HomeViewController: UITableViewController {
    
    

    @IBOutlet weak var lbCurrentBalance: UILabel!
    @IBOutlet weak var eyeCurrentBalance: UIButton!
    @IBOutlet weak var lbClientName: UILabel!
    @IBOutlet weak var lbFatura: UILabel!
    
    @IBOutlet weak var buttonMenu: UIButton!
    
    
    
    var array = [false, false, false, false, false]
    
    var valueHide = "******"
    var currentValue = clientes[indice].saldo
    var clientName = clientes[indice].name
    var faturaValue = clientes[indice].fatura
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        eyeCurrentBalance.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        lbCurrentBalance.text = "R$ \(currentValue)"
        eyeCurrentBalance.tintColor = .black
        lbClientName.text = "Olá, \(clientName)"
        lbFatura.text = "R$ \(faturaValue)"
        
        
        let logout = logoutApp()
        buttonMenu.menu = UIMenu(title: "", children: [logout])
        buttonMenu.showsMenuAsPrimaryAction = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func logoutApp() -> UIAction {
        return UIAction(title: "Sair", image: .none, identifier: .none, discoverabilityTitle: String?.none, attributes: .destructive, state: .off, handler: {action in self.navigationController?.popViewController(animated: true)})
    }
    
        
    @IBAction func buttonEyeCurrentBalance(_ sender: Any) {
        if eyeCurrentBalance.currentImage == UIImage(systemName: "eye.slash.fill") {
            eyeCurrentBalance.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            lbCurrentBalance.text = "R$ \(valueHide)"
            lbFatura.text = "R$ \(valueHide)"
        } else {
            eyeCurrentBalance.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            lbCurrentBalance.text = "R$ \(currentValue)"
            lbFatura.text = "R$ \(faturaValue)"
        }
    }

}
