//
//  ContentView.swift
//  Countries
//
//  Created by Ben Hardy on 11/3/23.
//

import SwiftUI


struct ContentView: View {
    @State private var countries: [Country] = []

    var body: some View {
        NavigationView {
            List(countries, id: \.id) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    Text(country.name.common)
                }
            }
            .navigationTitle("Countries")
        }
        .onAppear {
            CountryService().fetchCountries { fetchedCountries in
                self.countries = fetchedCountries.sorted {
                    $0.name.common.localizedCaseInsensitiveCompare($1.name.common) == .orderedAscending
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
