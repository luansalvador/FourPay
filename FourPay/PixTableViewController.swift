//
//  PixTableViewController.swift
//  FourPay
//
//  Created by user212294 on 2/9/22.
//

import UIKit
import CoreData
class PixTableViewController: UIViewController {
    
    
    @IBOutlet weak var tfChavePix: UITextField!
    @IBOutlet weak var tfValor: UITextField!
        //var chavePix:String = " "
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func tapButtonTransfer(_ sender: Any) {
        transferir()
        
        
        }
        
    func transferir() {
            
        var valorPix = Double(tfValor.text!)
        var chavePix = tfChavePix.text ?? ""
            
            
        
        
            
            
        if chavePix == "" || valorPix == 0 {
            let alert = UIAlertController(title: "Falha no login", message: "Por favor, preencha todos os campos", preferredStyle: .alert)
                
            alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        else {
            let count: Int = clientes.count - 1
            for i in 0...count{
                if chavePix == clientes[i].cpf{
                    indiceSaldo = i
                    if valorPix! <= clientes[indice].saldo  {
                        //conta atual e conta que recebe(local)
                        clientes[indice].saldo = clientes[indice].saldo - valorPix!
                        clientes[indiceSaldo].saldo = clientes[indiceSaldo].saldo + valorPix!
                        print(clientes[indice].saldo)
                        
                        //alerta e reset dos campos
                        let alert = UIAlertController(title: "Sucesso", message: "Transferencia concluida", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        chavePix = ""
                        valorPix = 0
                        
                        
                        //Atualizar informacoes core data conta atual
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Users")
                        let predicate = NSPredicate(format: "cpf =  '\(clientes[indice].cpf)'")
                        fetchRequest.predicate = predicate
                        do {
                            let object = try context.fetch(fetchRequest)
                            if object.count == 1 {
                                let objectUpdate = object.first as! NSManagedObject
                                objectUpdate.setValue(clientes[indice].saldo, forKey: "saldo")
                                do {
                                    try context.save()
                                    
                                } catch {
                                    print("erro")
                                }
                            }
                            
                            let predicate1  = NSPredicate(format: "cpf =  '\(clientes[indiceSaldo].cpf)'")
                            fetchRequest.predicate = predicate1
                            do {
                                let object = try context.fetch(fetchRequest)
                                if object.count == 1
                                {
                                    let objectUpdate = object.first as! NSManagedObject
                                    objectUpdate.setValue(clientes[indiceSaldo].saldo, forKey: "saldo")
                                    
                                    do {
                                        try context.save()
                                    } catch {
                                        print("erro")
                                    }
                                }
                            }
                                
                        } catch {
                            
                            print("erro")
                            
                            
                        }
                    }
                                                    
                } else {
                        
                }
            
                
            }
            
            
            
            
            
        }
                
                
                
            
        
    }
    
}
