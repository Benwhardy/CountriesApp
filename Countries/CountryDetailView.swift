//
//  CountryDetailView.swift
//  Countries
//
//  Created by Ben Hardy on 11/3/23.
//

import SwiftUI

struct CountryDetailView: View {
    var country: Country

    var body: some View {
        VStack (alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text(country.name.common)
                    .font(.largeTitle)
                    .padding(.horizontal)

                HStack {
                    Text("Population:")
                        .fontWeight(.bold)
                    Text("\(country.population)")
                }
                .padding(.horizontal)
                
            }
            .padding(.top)
            
            HStack {
                Text("Languages:")
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    if let languages = country.languages?.values, let firstLanguage = languages.first {
                        Text(firstLanguage)
                    } else {
                        Text("No official language")
                    }
                }
            }
            .padding(.horizontal)

            
          
            MapView(country: country)
                .frame(maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
    }
}
