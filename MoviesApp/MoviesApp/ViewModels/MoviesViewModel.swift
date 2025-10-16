import Foundation

@Observable final class MoviesViewModel {
    var latestMoviesState: LoadableState<MoviesModel<MoviesResults>> = .idle
    var topRatedMoviesState: LoadableState<MoviesModel<MoviesResults>> = .idle
    var popularMoviesState: LoadableState<MoviesModel<MoviesResults>> = .idle
    var upcomingMoviesState: LoadableState<MoviesModel<MoviesResults>> = .idle

   @ObservationIgnored private let repository: MoviesService

    init(repository: MoviesService=MoviesService()) {
        self.repository = repository
    }
    
    func getLatestMovies() async{
        latestMoviesState = .loading
        do {
            let movies = try await repository.getLatestMovies()
            self.latestMoviesState = .success(movies)
        } catch {
            self.latestMoviesState = .failure(error.localizedDescription)
        }
    }
    
    func getTopRatedMovies() async{
        topRatedMoviesState = .loading
        do {
            let movies = try await repository.getTopRatedMovies()
            self.topRatedMoviesState = .success(movies)
        } catch {
            self.topRatedMoviesState = .failure(error.localizedDescription)
        }
    }
    
    func getPopularMovies() async{
        popularMoviesState = .loading
        do {
            let movies = try await repository.getPopularMovies()
            self.popularMoviesState = .success(movies)
        } catch {
            self.popularMoviesState = .failure(error.localizedDescription)
        }
    }
    
    func getUpcomingMovies() async{
        upcomingMoviesState = .loading
        do {
            let movies = try await repository.getUpcomingMovies()
            self.upcomingMoviesState = .success(movies)
        } catch {
            self.upcomingMoviesState = .failure(error.localizedDescription)
        }
    }
}
