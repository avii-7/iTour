//
//  EditDestinationView.swift
//  iTour
//
//  Created by Arun Kumar on 02/12/24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination: Destination
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section ("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditDestinationView(destination: .init())
}
