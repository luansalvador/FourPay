//
//  EmprestimoTableViewController.swift
//  FourPay
//
//  Created by user212294 on 2/17/22.
//

import UIKit

class EmprestimoTableViewController: UITableViewController {
    
    @IBOutlet weak var btParcelas: UIButton!
    @IBOutlet weak var btDataPagmto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let menuParcelas = UIMenu(title: "", image: nil, identifier: nil ,options: .displayInline, children: [parcela3, parcela6, parcela10, parcela12, parcela18, parcela24, parcela36, parcela48])
        let menuData = UIMenu(title: "", image: nil, identifier: nil ,options: .displayInline, children: [dia5, dia10, dia25])
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Emprestimos"
        
        btParcelas.menu = menuParcelas
        btParcelas.changesSelectionAsPrimaryAction = true
        btParcelas.showsMenuAsPrimaryAction
        
        btDataPagmto.menu = menuData
        btDataPagmto.changesSelectionAsPrimaryAction = true
        btDataPagmto.showsMenuAsPrimaryAction
    }
    
    
    //variaveis para opcoes do pop up button de operadora
    let parcela3 = UIAction(title: "3x", image: nil) { (action) in}
    let parcela6 = UIAction(title: "6x", image: nil) { (action) in}
    let parcela10 = UIAction(title: "10x", image: nil) { (action) in}
    let parcela12 = UIAction(title: "12x", image: nil) { (action) in}
    let parcela18 = UIAction(title: "18x", image: nil) { (action) in}
    let parcela24 = UIAction(title: "24x", image: nil) { (action) in}
    let parcela36 = UIAction(title: "36x", image: nil) { (action) in}
    let parcela48 = UIAction(title: "48x", image: nil) { (action) in}
    
    //variaveis para opcoes do pop up button de operadora
    let dia5 = UIAction(title: "Dia 5", image: nil) { (action) in}
    let dia10 = UIAction(title: "Dia 10", image: nil) { (action) in}
    let dia25 = UIAction(title: "Dia 25", image: nil) { (action) in}
        
    @IBAction func btMakeLoan(_ sender: Any) {
        
        let alert = UIAlertController(title: "Deseja realizar esse emprestimo?", message: .none, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Realizar Emprestimo", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "CANCELAR", style: .cancel, handler:nil))
        self.present(alert, animated: true)
        
    }
    
}
