import Foundation

@Observable final class TVShowsViewModel {
    var latestShowsState: LoadableState<MoviesModel<TVShowsResults>> = .idle
    var popularShowsState: LoadableState<MoviesModel<TVShowsResults>> = .idle
    var topRatedShowsState: LoadableState<MoviesModel<TVShowsResults>> = .idle
    
   @ObservationIgnored private let repository: TVShowsService

    init(repository: TVShowsService=TVShowsService()) {
        self.repository = repository
    }
    
    func getLatestShows() async{
        latestShowsState = .loading
        do {
            let shows = try await repository.getLatestShows()
            self.latestShowsState = .success(shows)
        } catch {
            self.latestShowsState = .failure(error.localizedDescription)
        }
    }
    
    func getPopularShows() async{
        popularShowsState = .loading
        do {
            let shows = try await repository.getPopularShows()
            self.popularShowsState = .success(shows)
        } catch {
            self.popularShowsState = .failure(error.localizedDescription)
        }
    }
    
    func getTopRatedShows() async{
        topRatedShowsState = .loading
        do {
            let shows = try await repository.getTopRatedShows()
            self.topRatedShowsState = .success(shows)
        } catch {
            self.topRatedShowsState = .failure(error.localizedDescription)
        }
    }
}
