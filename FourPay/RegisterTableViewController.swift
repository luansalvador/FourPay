//
//  RegisterTableViewController.swift
//  FourPay
//
//  Created by user212294 on 1/12/22.
//

import UIKit
import CoreData
//import FirebaseAuth



class RegisterTableViewController: UITableViewController {
    
    

    @IBOutlet weak var ivDefinedProfilePhoto: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfCPF: UITextField!
    @IBOutlet weak var tfRG: UITextField!
    @IBOutlet weak var tfBirth: UITextField!
    @IBOutlet weak var tfIncome: UITextField!
    @IBOutlet weak var tfMaritalState: UITextField!
    @IBOutlet weak var tfAdress: UITextField!
    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var tfComplement: UITextField!
    @IBOutlet weak var tfBairro: UITextField!
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var tfCEP: UITextField!
    @IBOutlet weak var tfState: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfCelphone: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmePassword: UITextField!
    
    
    @IBOutlet weak var swButton: UISwitch!
    
    var registerData: [UITextField] = []
    var posicaoTextFieldAtual = 0
    
    
    override func viewDidLoad() {
        tableView.allowsSelection = false
        registerData = [ tfName, tfCPF, tfRG, tfBirth, tfIncome, tfMaritalState, tfAdress, tfNumber, tfComplement, tfBairro, tfCity, tfCEP, tfState, tfEmail, tfCelphone, tfPassword, tfConfirmePassword]
        globalRegisterData = registerData
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("image"), object: nil)
        swButton.isOn = false
        saveData()
        fetchRequest()
        
        for tf in registerData {
            tf.delegate = self
        }
        
        tfName.becomeFirstResponder()
    }
    
    
    
    
    //ARMAZENAR DADOS NO CORE DATA
    func saveData(){
        let loginTxt = tfCPF.text
        let senhaTxt = tfPassword.text
        let incomeTxt = tfIncome.text
        let nameTxt = tfName.text
        let saldoTxt:Double = 0
        let faturaTxt:Double = 0
        
        let context = ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        
        let newCliente = Users(entity: entity!, insertInto: context)
        newCliente.cpf = loginTxt
        newCliente.password = senhaTxt
        newCliente.income = incomeTxt
        newCliente.name = nameTxt
        newCliente.fatura = faturaTxt
        newCliente.saldo = faturaTxt
        
        
        do {
            try context.save()
            print("armazenou")
        }
        catch {
            print("error para armazenar dados")
        }
    }
    
    
    @IBAction func btConfirmIdentity(_ sender: Any) {
        let alerta = UIAlertController(title: "Confirme sua identidade", message: "Por favor, envie uma foto do seu rosto!", preferredStyle: .actionSheet)
        
        let takePicture = UIAlertAction(title: "Tirar Foto", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "toCamera", sender: (Any).self)
            
        })
        
        alerta.addAction(takePicture)
        
        self.present(alerta, animated: true)
        
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let image = notification.object as! UIImage?
        ivDefinedProfilePhoto.image = image
    }
    
    
    @IBAction func btTerms(_ sender: Any) {
        swButton.isOn = true
    }
    
    
    
    
    @IBAction func btRegister(_ sender: Any) {
        tfCPF.text = tfCPF.text?.cleanFormatMask()
        let count: Int = clientes.count - 1
        var position = -5
        for i in 0...count{
            if tfCPF.text == clientes[i].cpf{
                position = i
                let alert = UIAlertController(title: "ERRO", message: "O Cpf digitado já está cadastrado", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler:nil))
                self.present(alert, animated: true)
            }
        }
            

            if swButton.isOn {
                if globalRegisterData.allSatisfy({$0.hasText}) == true {
                    if tfPassword.text == tfConfirmePassword.text {
                        if profilePhoto != 0 {
                            if position == -5 {
                                saveData()
                                self.performSegue(withIdentifier: "toCardView", sender: nil)
                            }
                        } else {
                            let alert = UIAlertController(title: "ERRO", message: "Favor favor validar foto", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler:nil))
                            self.present(alert, animated: true)
                        }
                    } else {
                        let alert = UIAlertController(title: "ERRO", message: "Senhas divergentes", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler:nil))
                        self.present(alert, animated: true)
                        }
                    
                } else {
                    let alert = UIAlertController(title: "ERRO", message: "Favor preencher todos os campos", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler:nil))
                    self.present(alert, animated: true)
                }
                
            } else {
                let alert = UIAlertController(title: "ERRO", message: "Leia os termos e condicoes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler:nil))
                self.present(alert, animated: true)
            }
        
    }
    
        
}

extension String {
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex

        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }

        return result
    }
    
    func cleanFormatMask() -> String {
        return components(separatedBy: .decimalDigits.inverted).joined()
    }
}
    

extension RegisterTableViewController: UITextViewDelegate {
    
    //mascaras
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if tfBirth.isEditing == true {
            tfBirth.text = tfBirth.text?.formatMask(mask: "##/##/####")
        }
        
        if tfCPF.isEditing == true {
            tfCPF.text = tfCPF.text?.formatMask(mask: "###.###.###-##")
        }
        
        if tfRG.isEditing == true {
            tfRG.text = tfRG.text?.formatMask(mask: "##.###.###-#")
        }
        
        if tfCEP.isEditing == true {
            tfCEP.text = tfCEP.text?.formatMask(mask: "##.###-###")
        }
        
        if tfCelphone.isEditing == true {
            tfCelphone.text = tfCelphone.text?.formatMask(mask: "(##) #########")
        }
    }
}

extension RegisterTableViewController: UITextFieldDelegate {
    	
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        posicaoTextFieldAtual = posicaoTextFieldAtual + 1
        if posicaoTextFieldAtual > 16 {
            posicaoTextFieldAtual = 0
        }
        let novoTextField = registerData[posicaoTextFieldAtual]
        novoTextField.becomeFirstResponder()
        self.tableView.scrollRectToVisible(novoTextField.frame, animated: true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        posicaoTextFieldAtual = registerData.firstIndex(of: textField)!
    }
}
