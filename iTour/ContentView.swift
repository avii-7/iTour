//
//  ContentView.swift
//  iTour
//
//  Created by Arun on 01/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var sortOrder = SortDescriptor(\Destination.name)
    
    @State private var path = [Destination]()
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack (path: $path) {
            DestinationListingView(sort: sortOrder)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            addDestination()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Name")
                                    .tag(SortDescriptor(\Destination.name))
                                
                                Text("Priority")
                                    .tag(SortDescriptor(\Destination.priority, order: .reverse))
                                
                                Text("Date")
                                    .tag(SortDescriptor(\Destination.date))
                            }
                            .pickerStyle(.inline)
                        }
                    }
                }
        }
    }
}

extension ContentView {
    
    private func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    
}

#Preview {
    ContentView()
        .modelContainer(for: Destination.self, inMemory: true)
}
