//
//  ContentView.swift
//  HelloDemoApp
//
//  Created by Võ Toàn on 21/04/2023.
//

import SwiftUI
import HelloLoggingFramework

struct Stock {
    var name: String
    var price: Double
}

extension Stock {
    static let testStocks = [Stock(name: "Banana", price: 125),
                             Stock(name: "TapeBook", price: 320),
                             Stock(name: "Ramalon", price: 3200)]
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Stock.testStocks, id: \.name, rowContent: WatchlistRow.init)
                .navigationTitle("Stocktance")
                .toolbar {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                    }
                }
        }
        .accentColor(.purple)
    }
}

struct WatchlistRow: View {
    var stock: Stock
    
    var body: some View {
        HStack {
            Text(stock.name)
            
            Spacer()
            
            Text("$" + String(format: "%.2f", stock.price))
                .foregroundColor(.white)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGreen)))
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
