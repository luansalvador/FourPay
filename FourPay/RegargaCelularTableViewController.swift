//
//  RegargaCelularTableViewController.swift
//  FourPay
//
//  Created by user212294 on 2/17/22.
//

import UIKit

class RegargaCelularTableViewController: UITableViewController {
    
    @IBOutlet weak var popUpButtonOperadora: UIButton!
    @IBOutlet weak var popUpButtonPayment: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        
        let menuOperadora = UIMenu(title: "", image: nil, identifier: nil ,options: .displayInline, children: [fourCall, opcao2, opcao3])
        let menuPayment = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [fourPay, cartao1, cartao2])
        
       
        popUpButtonOperadora.menu = menuOperadora
        popUpButtonOperadora.changesSelectionAsPrimaryAction = true
        popUpButtonOperadora.showsMenuAsPrimaryAction
        
        popUpButtonPayment.menu = menuPayment
        popUpButtonPayment.changesSelectionAsPrimaryAction = true
        popUpButtonPayment.showsMenuAsPrimaryAction
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Recarga de celular"
    }

    //variaveis para opcoes do pop up button de operadora
    let fourCall = UIAction(title: "FourCall", image: nil) { (action) in}
    let opcao2 = UIAction(title: "Opcao 1", image: nil) { (action) in}
    let opcao3 = UIAction(title: "Opcao 2", image: nil) { (action) in}
    
    //variaveis para opcoes do pop up button de operadora
    let fourPay = UIAction(title: "FourPay", image: nil) { (action) in}
    let cartao1 = UIAction(title: "Cartao 1", image: nil) { (action) in}
    let cartao2 = UIAction(title: "Cartao 2", image: nil) { (action) in}

    @IBAction func btContinue(_ sender: Any) {
        let alert = UIAlertController(title: "Confirme os dados antes de prosseguir", message: .none, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Confirmo, recarregar", style: .default, handler: { (action) in 
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "CANCELAR", style: .cancel, handler:nil))
        self.present(alert, animated: true)
        
    }
    

}
