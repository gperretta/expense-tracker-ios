//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import SwiftUI

struct TransactionRow: View {
    var transactionData : Transaction
    var body: some View {
        
        // MARK: List row UI & content
        HStack (spacing: 20) {
            
            /// - category icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: transactionData.icon)
                        .renderingMode(.template)
                }
            VStack(alignment: .leading, spacing: 4) {
                /// - transaction merchant
                Text(transactionData.merchant)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                /// - transaction category
                Text(transactionData.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                /// - transaction date
                Text(transactionData.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            /// - transaction amount
            Text(transactionData.signedAmount, format: .currency(code: "USD"))
                .fontWeight(.bold)
                .foregroundColor(transactionData.type == TransactionType.credit.rawValue ? Color.text : .primary)
                
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transactionData: transactionPreviewData)
    }
}
