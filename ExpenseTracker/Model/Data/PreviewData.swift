//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(
    id: 1, date: "01/04/2023", institution: "BPER", account: "BPER Card", merchant: "Apple", amount: 14.99, type: "debit", categoryId: 001, category: "Software", isPending: false, isTransfer: false, isExpense: false, isEdited: false
)

// a tip to spare some times
var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
