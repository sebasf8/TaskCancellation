//
//  ContentView.swift
//  TaskCancellation
//
//  Created by Sebastian Fernandez on 23/2/25.
//

import SwiftUI

struct CancellationFromViewModelView: View {
    @StateObject private var viewModel = CancellationFromViewModelViewModel()

    var body: some View {
        VStack {
            Toggle(isOn: $viewModel.isFilterOneActive) {
                Text("Filter One")
            }
            Toggle(isOn: $viewModel.isFilterTwoActive) {
                Text("Filter One")
            }
            Toggle(isOn: $viewModel.isFilterThreeActive) {
                Text("Filter Three")
            }
        }
        .padding()
        .onDisappear {
            viewModel.cancelTasks()
        }
    }
}

#Preview {
    CancellationFromViewModelView()
}
