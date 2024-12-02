//
//  ContentView.swift
//  iTour
//
//  Created by Arun on 01/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack (alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date, format: .dateTime)
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addSamples()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

extension ContentView {
    
    private func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "naples")
        
        for item in [rome, florence, naples] {
            modelContext.insert(item)
        }
    }
}

#Preview {
    ContentView()
}
