//
//  PreviewData.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/20/24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "APPLESTORE", account: "Visa Account", merchant: "Apple", amount: 1993.23, type: "debit", categoryId: 801, category: "Hardware", isPending: false , isTransfer: false, isExpense: false, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
    
