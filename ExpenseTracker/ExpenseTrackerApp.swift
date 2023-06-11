//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    /// def var to initialise the VM when the app launches as
    /// StateObject: to follow the object life cycle through the app
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
            /// .environmentObject: to allow all its children to access the object
        }
    }
}
