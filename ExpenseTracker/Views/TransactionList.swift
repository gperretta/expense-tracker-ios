//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Gilda on 06/01/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    var body: some View {
        //NavigationView {
            VStack {
                
                List {
                    // MARK: Transactions Groups
                    ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) {
                        month, transactions in
                        
                        Section {
                            ForEach(transactions) { transaction in
                                TransactionRow(transactionData: transaction)
                            }
                        } header: {
                            Text(month)
                        }
                        .listSectionSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    //}
}

struct TransactionList_Previews:
    PreviewProvider {
    // we declare a lazy static variable to inject the preview (trick)
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        TransactionList()
            .environmentObject(transactionListVM)
        TransactionList().environmentObject(transactionListVM).preferredColorScheme(.dark)
    }
}
