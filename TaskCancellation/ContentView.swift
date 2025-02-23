//
//  ContentView.swift
//  TaskCancellation
//
//  Created by Sebastian Fernandez on 23/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink {
                    CancellationFromViewModelView()
                } label: {
                    Text("Cancellation from viewModel")
                        .font(.title2)
                }
                NavigationLink {
                    CancellationFromViewView()
                } label: {
                    Text("Cancellation from View")
                        .font(.title2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
