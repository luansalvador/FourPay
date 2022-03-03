//
//  LoginViewController.swift
//  FourPay
//
//  Created by user212294 on 1/3/22.
//

import UIKit
import CoreData

var usuario:[String] = [""]
var senha:[String] = [""]
var indice: Int = 0
var indiceSaldo: Int = 0
var valorDoPix: Double = 0 

//var pix:[String] = [""]

class LoginViewController: UIViewController {

    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassoword: UITextField!
    
    @IBOutlet weak var swSaveLogin: UISwitch!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    
    
    
   override func viewDidDisappear(_ animated: Bool) {
       if swSaveLogin.isOn == false {
            tfLogin.text = ""
            tfPassoword.text = ""
            
        }else {
            tfLogin.text = tfLogin.text ?? ""
            tfPassoword.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        tfPassoword.isSecureTextEntry = true
        super.viewDidLoad()
        fetchRequest()
    

        // Do any additional setup after loading the view.
    }
    
    /*func fetchRequest() {
        
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
    }*/
    
    
    
    
    func showAlert() {
        let alertLogin = UIAlertController(title: "OPS!", message: "Login ou senha incorretos", preferredStyle: .alert)
        
        alertLogin.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
        present(alertLogin, animated: true)
    }
    
    /*func isLoginValid ( login : String) -> Bool {
        //criar um loop para me dar uma posicao
        
        
        if login.count > 3 && login == "admin" /*substituir pela linha comentada de posicao no GlobalViewController */{
            return true
        } else {
            return false
        }
    }
    
    func isPasswordValid ( password : String) -> Bool {
        if password == "123456" {
            return true
        } else {
            return false
        }
    }
    //func check (login: String?, password:String?) -> (Bool) {
    func check (login:String? , password:String?) -> (Bool) {
        if let login = login, isLoginValid(login: login) {
            if let password = password, isPasswordValid(password: password) {
                return (true)
            } else {
                showAlert()
                return(false)
            }
        } else {
            showAlert()
            return(false)
        }        
    }*/
    
    @IBAction func showPassword(_ sender: UIButton) {
        if tfPassoword.isSecureTextEntry == true  {
            tfPassoword.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            tfPassoword.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    
    @IBAction func btEntrar(_ sender: Any) {
        
        usuario[0] = tfLogin.text ?? ""
        senha[0] = tfPassoword.text ?? ""
        
        
        if usuario[0] == "" || senha[0] == "" {
            let alert = UIAlertController(title: "Falha no login", message: "Por favor, preencha todos os campos", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        else {
            let count: Int = clientes.count - 1
            for i in 0...count{
                if usuario[0] == clientes[i].cpf{
                    indice = i
                } else {
                    
                }
            }
        }
            
        
        if usuario[0] == clientes[indice].cpf && senha[0] == clientes[indice].password {
            performSegue(withIdentifier: "toHome", sender: nil)
        } else{
            showAlert()
        }
        
        
        //check(login: tfLogin.text, password: tfPassoword.text)
        //performSegue(withIdentifier: "toHome", sender: nil)
        
    }
    
    /*func opix() {
        pix[0] = tfChavePixPagar
        var tfvalorPix:Int
        let count: Int = clientes.count - 1
        for i in 0...count{
            if pix[0] == clientes[i].cpf {
                indice = i
                
            }
            pix[0] = clientes[indice].saldo
        }
        
    }*/
    
    
    
   /* override func viewDidDisappear(_ animated: Bool) {
        if swSaveLogin.isOn == false {
            tfLogin.text = ""
            tfPassoword.text = ""
        }else {
            tfLogin.text = tfLogin.text ?? ""
            tfPassoword.text = ""
        }
    }
*/
    

    
}
