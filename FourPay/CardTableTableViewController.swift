//
//  CardTableTableViewController.swift
//  FourPay
//
//  Created by user212294 on 1/20/22.
//

import UIKit

class CardTableTableViewController: UITableViewController {
    
    var array = [false, false, false]
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        var indice = 0
        for _ in array {
            tableView.cellForRow(at: IndexPath(row: indice, section: 0))?.accessoryType = .none
            indice = indice + 1
        }
        
        
        
        if indexPath.row < 2 {
            flag = flag + 1
            let celulaTocada = tableView.cellForRow(at: indexPath as IndexPath)
            celulaTocada?.accessoryType = .checkmark
            array[indexPath.row] = true
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            flag = 0
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
            //self.tableView.cellForRow (at: indexPath as IndexPath)?.accessoryType = .checkmark
        //tableView.deselectRow(at: indexPath, animated: true)
            //self.tableView.deselectRow(at: indexPath, animated: true)
    

  /* override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
    }*/
     

    @IBAction func btStart(_ sender: Any) {
        if flag > 0 {
            let alert = UIAlertController(title: "Cadastro Realizado" , message: "Agora você é um Four", preferredStyle: .alert)
            let goToLogin = UIAlertAction(title: "Fazer login", style: .default, handler: {(alert: UIAlertAction) in self.backTwo() })
            alert.addAction(goToLogin)
            present(alert, animated: true, completion: nil)
        } else {
            
            let alert = UIAlertController(title: "Erro" , message: "Favor selecionar uma opção", preferredStyle: .alert)
            let erroLogin = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(erroLogin)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func backTwo() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    

}
