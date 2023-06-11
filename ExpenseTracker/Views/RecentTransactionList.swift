//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Gilda on 06/01/23.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    private var iconLink = "chevron.right"
    
    var body: some View {
        //NavigationView {
            VStack {
                // MARK: Header UI & content
                HStack {
                    /// - header title
                    Text("Recent transactions")
                        .fontWeight(.bold)
                    
                    Spacer()
                    /// - header link
                    NavigationLink {
                        TransactionList()
                    } label: {
                        HStack(spacing: 4) {
                            Text("See all")
                            Image(systemName: iconLink)
                        }
                        .foregroundColor(Color.text)
                    }
                }
                .padding(.top)
                
                // MARK: Recent transactions (actual) list
                ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                    TransactionRow(transactionData: transaction)
                    
                    Divider()
                        .opacity(index == 4 ? 0 : 1)
                }
            }
            .padding()
            .background(Color.systemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            //.shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        //}
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    // we declare a lazy static variable to inject the preview (trick)
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionListVM)
        RecentTransactionList()
            .environmentObject(transactionListVM)
            .preferredColorScheme(.dark)
    }
}
