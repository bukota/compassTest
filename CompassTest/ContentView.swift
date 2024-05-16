//
//  ContentView.swift
//  CompassTest
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import SwiftUI

struct ContentView: View {

    @State private var model = ViewModel()
    
    var body: some View {
        if !model.hasData{
            Button("Fetch content") {
                Task {
                    await model.fetchContent()
                }
            }
            .accessibilityIdentifier("FetchButton")
            if model.isLoading {
                ProgressView()
                    .accessibilityIdentifier("ProgressView")
            }
        } else {
            ScrollView {
                LazyVStack {
                    Text("Every 10th Character Request")
                    Text(model.every10thCharacterResult)
                        .font(.caption2)
                        .padding()
                    Text("Word Counter Result")
                    Text(model.wordCounterRequestResult)
                        .font(.caption2)
                        .padding()
                }.frame(maxWidth: .infinity)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
