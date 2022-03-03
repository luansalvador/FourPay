//
//  GlobalItensViewController.swift
//  FourPay
//
//  Created by user212294 on 1/20/22.
//

import UIKit
import CoreData

class Clientes {
    var name:String,
        cpf:String,
        income:String,
        password:String,
        saldo:Double,
        fatura:Double
    
    
    init (name:String, cpf:String, income:String, password:String, saldo:Double, fatura:Double){
        self.name = name
        self.cpf = cpf
        self.income = income
        self.password = password
        self.saldo = saldo
        self.fatura = fatura
       
        
    }
        
    
}

var clientes:[Clientes] = [Clientes(name: "luan", cpf: "luan", income: "1899.00", password: "luan123", saldo: 1000000.00, fatura: 5000.00)]


var globalRegisterData:[UITextField] = []




func fetchRequest() {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
    request.returnsObjectsAsFaults = false
    
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            clientes.append(Clientes(name: data.value(forKey: "name") as! String, cpf: data.value(forKey: "cpf") as! String, income: data.value(forKey: "income") as! String, password: data.value(forKey: "password") as! String, saldo: data.value(forKey: "saldo") as! Double, fatura: data.value(forKey: "fatura") as! Double))
        }
    }
    catch
    {
        print("ERRO")
        
    }
}
