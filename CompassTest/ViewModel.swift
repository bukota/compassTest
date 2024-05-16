//
//  ViewModel.swift
//  CompassTest
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import Foundation

@Observable
class ViewModel {
    
    private let baseUrl = URL(string: "https://www.compass.com/about/")!
    private let dataProccesor = DataProccesor()
    
    var every10thCharacterResult: String = ""
    var wordCounterRequestResult: String = ""
    var hasData: Bool {
        return !every10thCharacterResult.isEmpty || !wordCounterRequestResult.isEmpty
    }

    var isLoading: Bool = false

    func fetchContent() async {
        isLoading = true
        await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                self.every10thCharacterResult = await self.every10thCharacterRequest()
                self.isLoading = false
            }
            group.addTask {
                self.wordCounterRequestResult = await self.wordCounterRequestRequest()
                self.isLoading = false
            }
        }
    }

    private func every10thCharacterRequest() async -> String {
        guard let plainData = try? await fetchData() else { return "" }
        return dataProccesor.every10thCharacterRequest(from: plainData)
    }

    private func wordCounterRequestRequest() async -> String{
        guard let plainData = try? await fetchData() else { return "" }
        return dataProccesor.wordCounterRequest(from: plainData)
    }

    private func fetchData() async throws -> String {
        let (data, _) = try await URLSession.shared.data(from: baseUrl)
        return String(decoding: data, as: UTF8.self)
    }
}
