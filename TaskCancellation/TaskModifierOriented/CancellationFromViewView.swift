//
//  ContentView.swift
//  TaskCancellation
//
//  Created by Sebastian Fernandez on 23/2/25.
//

import SwiftUI

struct CancellationFromViewView: View {
    @StateObject private var viewModel = CancellationFromViewViewModel()

    var body: some View {
        VStack {
            Toggle(isOn: $viewModel.filters.isFilterOneActive) {
                Text("Filter One")
            }
            Toggle(isOn: $viewModel.filters.isFilterTwoActive) {
                Text("Filter One")
            }
            Toggle(isOn: $viewModel.filters.isFilterThreeActive) {
                Text("Filter Three")
            }
        }
        .padding()
        .task(id: viewModel.filters) {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    CancellationFromViewView()
}
