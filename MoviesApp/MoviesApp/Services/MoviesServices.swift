import Foundation

final class MoviesService {
    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func getLatestMovies() async throws -> MoviesModel<MoviesResults> {
        let response: MoviesModel = try await apiClient.request(
            endpoint: "/movie/now_playing?language=en-US&page=1"
        )
        return response
    }
    
    func getUpcomingMovies() async throws -> MoviesModel<MoviesResults> {
        let response: MoviesModel = try await apiClient.request(
            endpoint: "/movie/upcoming?language=en-US&page=1"
        )
        return response
    }
    func getTopRatedMovies() async throws -> MoviesModel<MoviesResults> {
        let response: MoviesModel = try await apiClient.request(
            endpoint: "/movie/top_rated?language=en-US&page=1"
        )
        return response
    }
    
    func getPopularMovies() async throws -> MoviesModel<MoviesResults> {
        let response: MoviesModel = try await apiClient.request(
            endpoint: "/movie/popular?language=en-US&page=1"
        )
        return response
    }
    
}
