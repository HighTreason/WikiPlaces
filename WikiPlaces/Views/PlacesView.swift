//
//  PlacesView.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import SwiftUI
import OSLog

struct PlacesView: View {
    @ObservedObject var viewModel: PlacesViewModel
    
    @State private var showAddLocationSheet = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .success:
                    content
                case .failure(let error):
                    Text("Error")
                        .onAppear() {
                            Logger.ui.error("ui state error \(error)")
                        }
                }
            }.onAppear {
                Task {
                    await viewModel.fetchLocations()
                }
            }
        }
    }
    
    var content: some View {
        VStack {
            Text(Strings.locations())
                .font(.largeTitle)
                .bold()
                .padding()
            Spacer()
            
            if let places = viewModel.places {
                ScrollView {
                    VStack {
                        ForEach(places.locations, id: \.name) { location in
                            LocationView(
                                viewModel: LocationViewModel(
                                    name: location.name ?? "",
                                    longitude: location.long.description,
                                    latitude: location.lat.description
                                ),
                                onTapGesture: {
                                    viewModel.startWikipediaApp(with: location)
                                }
                            )
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .sheet(isPresented: $showAddLocationSheet) {
                    AddLocationView(
                        onSave: { locationViewModel in
                            viewModel.add(location: locationViewModel)
                            showAddLocationSheet.toggle()
                        }
                    )
                    .presentationDetents([.medium])
                }
            } else {
                Text(Strings.no_locations())
                Spacer()
            }
        }
    }
    
    var addLocationButton: some View {
        VStack(spacing: 4) {
            Image(systemName: "plus")
                .accentColor(.blue)
        }
        .padding()
        .frame(width: 300, height: 100)
        .background(.gray)
        .cornerRadius(25)
        .foregroundColor(.white)
        .onTapGesture {
            showAddLocationSheet.toggle()
        }
    }
}

#Preview("Real Service") {
    PlacesView(
        viewModel: PlacesViewModel(
            service: PlacesService()
        )
    )
}
