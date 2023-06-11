//
//  TransactionData.swift
//  ExpenseTracker
//
//  Created by Gilda on 06/01/23.
//

import Foundation

extension Category {
    // main categories:
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", iconName: "road.lanes")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", iconName: "banknote")
    static let entertainment = Category(id: 3, name: "Entertainment", iconName: "popcorn")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", iconName: "dollarsign.arrow.circlepath")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", iconName: "fork.knife")
    static let home = Category(id: 6, name: "Home", iconName: "house")
    static let income = Category(id: 7, name: "Income", iconName: "dollarsign")
    static let shopping = Category(id: 8, name: "Shopping", iconName: "cart")
    static let transfer = Category(id: 9, name: "Transfer", iconName: "arrow.left.arrow.right")
    // subcategories:
    static let publicTransportation = Category(id: 101, name: "Public Transportation", iconName: "bus", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", iconName: "car", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", iconName: "candybarphone", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 202, name: "Movies & DVDs", iconName: "film.stack", mainCategoryId: 2)
    static let bankFee = Category(id: 401, name: "Bank Fee", iconName: "building.columns", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance charge", iconName: "dollarsign.arrow.circlepath", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", iconName: "carrot", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", iconName: "wineglass", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", iconName: "door.left.hand.closed", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", iconName: "lightbulb", mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", iconName: "pencil.and.outline", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", iconName: "desktopcomputer.and.arrow.down", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", iconName: "creditcard", mainCategoryId: 9)
}

extension Category {
    
    static let categories : [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories : [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all : [Category] = categories + subCategories
}

