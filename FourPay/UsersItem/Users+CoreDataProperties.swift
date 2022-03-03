//
//  Users+CoreDataProperties.swift
//  FourPay
//
//  Created by user212294 on 2/9/22.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var address: String?
    @NSManaged public var celphone: String?
    @NSManaged public var cep: String?
    @NSManaged public var city: String?
    @NSManaged public var complement: String?
    @NSManaged public var confirmPassword: String?
    @NSManaged public var cpf: String?
    @NSManaged public var email: String?
    @NSManaged public var fatura: Double
    @NSManaged public var income: String?
    @NSManaged public var maritalState: String?
    @NSManaged public var name: String?
    @NSManaged public var nascimento: String?
    @NSManaged public var neighborhood: String?
    @NSManaged public var number: String?
    @NSManaged public var password: String?
    @NSManaged public var rg: String?
    @NSManaged public var saldo: Double
    @NSManaged public var state: String?

}

extension Users : Identifiable {

}
