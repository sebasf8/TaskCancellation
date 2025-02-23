//
//  ViewModel.swift
//  TaskCancellation
//
//  Created by Sebastian Fernandez on 23/2/25.
//

import Combine
import Foundation

@MainActor final class CancellationFromViewModelViewModel: ObservableObject {
    @Published var isFilterOneActive = false
    @Published var isFilterTwoActive = false
    @Published var isFilterThreeActive = false

    private var filtersSubscription: AnyCancellable?
    private var task: Task<Void, Never>?

    init() {
        setupFiltersSubscription()
    }

    deinit {
        task?.cancel()
    }

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

    func cancelTasks() {
        task?.cancel()
    }

    private func setupFiltersSubscription() {
        filtersSubscription = $isFilterOneActive
            .combineLatest($isFilterTwoActive, $isFilterThreeActive)
            .sink { [weak self] _  in
                guard let self else { return }

                self.task?.cancel()
                self.task = Task { await self.fetchData() }
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


