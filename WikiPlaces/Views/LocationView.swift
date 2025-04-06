//
//  LocationView.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import SwiftUI

struct LocationView: View {
    let viewModel: LocationViewModel
    let onTapGesture: () -> ()
    
    var body: some View {
        VStack(spacing: 4) {
            if !viewModel.name.isEmpty {
                Text("\(viewModel.name)")
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            Image(systemName: "mappin.circle.fill")
                .accentColor(.blue)
                        
            if !viewModel.coordinates.isEmpty {
                Text("\(viewModel.coordinates)")
            }
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(.blue)
        .cornerRadius(25)
        .foregroundColor(.white)
        .onTapGesture {
            onTapGesture()
        }
    }
}

#Preview("All data") {
    LocationView(
        viewModel: LocationViewModel(
            name: "Amsterdam",
            longitude: "52.3547498",
            latitude: "4.8339215"
        ),
        onTapGesture: {}
    )
}

#Preview("Empty `name`") {
    LocationView(
        viewModel: LocationViewModel(
            name: "",
            longitude: "52.3547498",
            latitude: "4.8339215"
        ),
        onTapGesture: {}
    )
}

#Preview("All empty") {
    LocationView(
        viewModel: LocationViewModel(
            name: "",
            longitude: "",
            latitude: ""
        ),
        onTapGesture: {}
    )
}
