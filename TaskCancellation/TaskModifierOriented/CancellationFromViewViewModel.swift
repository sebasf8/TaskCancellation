//
//  ViewModel.swift
//  TaskCancellation
//
//  Created by Sebastian Fernandez on 23/2/25.
//

import Combine
import Foundation

@MainActor final class CancellationFromViewViewModel: ObservableObject {
    @Published var filters = Filters()

    init() { }

    func fetchData() async {
        do {
            print("Task has started")
            try await apiCall()
            print("Task has ended successfully")
        } catch where error is CancellationError {
            print("Task was cancelled")
        } catch {
            // Show UI error
        }
    }

    private func apiCall() async throws {
        //Simulates URLSession call, URLSession handle cancellation.
        for _ in 1...1000000 {
            try Task.checkCancellation()
            await Task.yield()
        }
    }
}

extension CancellationFromViewViewModel {
    struct Filters: Equatable {
        var isFilterOneActive = false
        var isFilterTwoActive = false
        var isFilterThreeActive = false
    }
}


