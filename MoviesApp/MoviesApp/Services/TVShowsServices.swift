import Foundation

final class TVShowsService {
    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func getLatestShows() async throws -> MoviesModel<TVShowsResults> {
        let response: MoviesModel<TVShowsResults> = try await apiClient.request(
            endpoint: "/tv/airing_today?language=en-US&page=1"
        )
        
        return response
    }
//    
//    func getUpcomingMovies() async throws -> MoviesModel {
//        let response: MoviesModel = try await apiClient.request(
//            endpoint: "/movie/upcoming?language=en-US&page=1"
//        )
//        return response
//    }
    func getTopRatedShows() async throws -> MoviesModel<TVShowsResults> {
        let response: MoviesModel<TVShowsResults> = try await apiClient.request(
            endpoint: "/tv/top_rated?language=en-US&page=1"
        )
        return response
    }
    
    func getPopularShows() async throws -> MoviesModel<TVShowsResults> {
        let response: MoviesModel<TVShowsResults> = try await apiClient.request(
            endpoint: "/tv/popular?language=en-US&page=1"
        )
        return response
    }
    
}
