//
//  DestinationListingView.swift
//  iTour
//
//  Created by Arun Kumar on 04/12/24.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var destinations: [Destination]
    
    init(sort: SortDescriptor<Destination>) {
        _destinations = Query(sort: [sort])
    }
    
    var body: some View {
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
    }
    
    private func deleteDestinations(_ indexSet: IndexSet) {
        indexSet.forEach { modelContext.delete(destinations[$0]) }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
