import Foundation

final class APIClient {
    func request<T: Decodable>(endpoint: String) async throws -> T {
        guard
            let url = URL(string: "\(Constants.baseURL)\(endpoint)")
        else {
            throw NetworkErrorHandler.invalidURL
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(
            "Bearer \(PrivateKeys.apiKey)",
            forHTTPHeaderField: "Authorization"
        )

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw NetworkErrorHandler.invalidResponse
        }
        do {

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            throw NetworkErrorHandler.invalidData
        }
    }
}
