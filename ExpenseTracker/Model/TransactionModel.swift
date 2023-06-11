//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import Foundation

struct Transaction : Identifiable, Decodable, Encodable, Hashable {
    
    // prop. names must match the names in the JSON file we fetch data from
    let id : Int
    let date : String
    let institution : String
    let account : String
    let merchant : String
    let amount : Double
    let type : TransactionType.RawValue
    var categoryId : Int
    var category : String
    var isPending : Bool
    var isTransfer : Bool
    var isExpense : Bool
    var isEdited : Bool
    
    // display the correct date format
    var dateParsed : Date {
        date.dateParsed()
    }
    
    // diplay positive numbers for credit, negative if in debt
    var signedAmount : Double {
        
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    // displayed icon in the list
    var icon : String {
        if let category = Category.all.first(where: {
            $0.id == categoryId
        }) {
            return category.iconName
        }
        return "questionmark.diamond"
    }
    
    // to sort the list by month (key)
    var month : String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType : String {
    
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    
    let id: Int
    let name : String
    let iconName : String
    var mainCategoryId : Int?
}

