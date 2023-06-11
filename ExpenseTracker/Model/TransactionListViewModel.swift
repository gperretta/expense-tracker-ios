//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Gilda on 06/01/23.
//

import Foundation
import Collections
import Combine

// MARK: Dictionary
typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
// from: public func data(_ data: [(String, Double)]) -> some View (@ ChartView)
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel : ObservableObject {
    @Published var transactions : [Transaction] = []
    
    /// def CANCELLABLES: for Combine imported! (see parameters) 
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    // MARK: Fetch data from a JSON file with an URL
    func getTransactions() {
        guard let sourceURL = URL(string: "https://designcode.io/data/transactions.json")
        else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: sourceURL)
            /// - parameters: (data, response) = tuple
            .tryMap {(data, response) -> Data in
                /// if there's a response -> typecast it as HTTURLResponse
                /// then verify its status code
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    // print in a more readable format (good for logging objects)
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            /// NB: the sink & store process allows to automatically update the view
            .sink { completion in
                switch completion {
                /// 1. if it's a failure case  -> error
                case .failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                /// 2. if the fetching is actually completed -> ok
                case .finished:
                    print("Finished fetching transactions.")
                }
            } /// NB: create a weak reference to self to prevent memory leaks
            receiveValue: { [weak self] result in
                self?.transactions = result
                //dump(self?.transactions)
            }
        /// - parameters: cancellables (as a reference)
        /// when the reference get allocated, it will cancel the 'subscription' and free all the resources
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        
        guard !transactions.isEmpty else {return [:]}
        
        let groupedTransactions = TransactionGroup(grouping: transactions) {
            $0.month
        }
        
        return groupedTransactions
    }
    
    var counter = 0;
    func accumulateTransactions() -> TransactionPrefixSum {
        
        counter += 1
        print("accumulateTransactions, call #", counter)
        guard !transactions.isEmpty else {return []}
        
        let today = "02/17/2022".dateParsed()   // Date() -> but we're using a dummy file
        // forced unwrap - we're sure the today date exists and we can pull the date interval for the month
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
        
        var sum : Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60*60*24) {
            
            let dailyExpenses = transactions.filter({
                $0.dateParsed == date && $0.isExpense
            })
            let dailyTotal = dailyExpenses.reduce(0) {
                $0 - $1.signedAmount
            }
            
            sum += dailyTotal
            sum = sum.roundedNumber()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal:", dailyTotal, "sum: ", sum)
        }
                  
        return cumulativeSum
    }
}
