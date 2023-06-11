//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView(showShadow: false) {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        //.data(demoData)
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: .systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.7), Color.icon)))
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        //.shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    
                    // MARK: Recent transaction list
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationTitle("Overview")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
        ContentView()
            .environmentObject(transactionListVM)
            .preferredColorScheme(.dark)
    }
}
