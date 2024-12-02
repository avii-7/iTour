//
//  ContentView.swift
//  iTour
//
//  Created by Arun on 01/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var path = [Destination]()
    
    @Environment(\.modelContext) var modelContext
    
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack (path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack (alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date, format: .dateTime)
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addDestination()
                    } label: {
                        Image(systemName: "plus")
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
    
    private func deleteDestinations(_ indexSet: IndexSet) {
        indexSet.forEach { modelContext.delete(destinations[$0]) }
    }
}

#Preview {
    ContentView()
}
