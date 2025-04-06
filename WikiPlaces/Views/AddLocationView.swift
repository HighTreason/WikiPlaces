//
//  AddLocationView.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import SwiftUI

struct AddLocationView: View {
    @State fileprivate(set) var name: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
        
    let onSave: (LocationViewModel) -> ()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(Strings.addLocation())
                .font(.headline)
            
            TextField(Strings.location_name(), text: $name)
                .textFieldStyle(.roundedBorder)
            
            TextField(Strings.latitude(), text: $latitude)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            TextField(Strings.longitude(), text: $longitude)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Button(Strings.save()) {
                onSave(
                    LocationViewModel(
                        name: name,
                        longitude: longitude,
                        latitude: latitude
                    )
                )
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding(40)
    }
}

#Preview {
    AddLocationView(onSave: { _ in })
}
