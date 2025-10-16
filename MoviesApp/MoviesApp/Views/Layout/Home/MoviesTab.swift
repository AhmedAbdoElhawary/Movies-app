import SwiftUI

struct MoviesView: View {
    @State private var moviesViewModel = MoviesViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
                CategoriesOptions()

                GroupOfMoviesTitle(
                    title: "Upcoming Movies",
                    subTitle: "View all"
                )
                HorizontalMoviesList(
                    loadableState: $moviesViewModel.upcomingMoviesState,
                    initailRequest: {
                        await moviesViewModel.getUpcomingMovies()
                    }
                )
                .task {
                    await moviesViewModel.getUpcomingMovies()
                }
                GroupOfMoviesTitle(title: "Latest Movies", subTitle: "View all")
                HorizontalMoviesList(
                    loadableState: $moviesViewModel.latestMoviesState,
                    initailRequest: {
                        await moviesViewModel.getLatestMovies()
                    }
                )
                .task {
                    await moviesViewModel.getLatestMovies()
                }

                GroupOfMoviesTitle(title: "Top Movies", subTitle: "View all")
                HorizontalMoviesList(
                    loadableState: $moviesViewModel.topRatedMoviesState,
                    initailRequest: {
                        await moviesViewModel.getTopRatedMovies()
                    }
                )
                .task {
                    await moviesViewModel.getTopRatedMovies()
                }

                GroupOfMoviesTitle(
                    title: "Popular Movies",
                    subTitle: "View all"
                )
                HorizontalMoviesList(
                    loadableState: $moviesViewModel.popularMoviesState,
                    initailRequest: {
                        await moviesViewModel.getPopularMovies()
                    }
                )
                .task {
                    await moviesViewModel.getPopularMovies()
                }

            }
        }

    }
}

#Preview {
    MoviesView()
}
