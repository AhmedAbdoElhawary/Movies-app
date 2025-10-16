import SwiftUI

struct TVShowsView: View {
    @State private var showsViewModel = TVShowsViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
                CategoriesOptions()

                GroupOfMoviesTitle(title: "Latest Shows", subTitle: "View all")
                HorizontalMoviesList(
                    loadableState: $showsViewModel.latestShowsState,
                    initailRequest: {
                        await showsViewModel.getLatestShows()
                    }
                )
                .task {
                    await showsViewModel.getLatestShows()
                }

                GroupOfMoviesTitle(title: "Top Shows", subTitle: "View all")
                HorizontalMoviesList(
                    loadableState: $showsViewModel.topRatedShowsState,
                    initailRequest: {
                        await showsViewModel.getTopRatedShows()
                    }
                )
                .task {
                    await showsViewModel.getTopRatedShows()
                }
                GroupOfMoviesTitle(title: "Popular Shows", subTitle: "View all")
                HorizontalMoviesList(
                    loadableState: $showsViewModel.popularShowsState,
                    initailRequest: {
                        await showsViewModel.getPopularShows()
                    }
                )
                .task {
                    await showsViewModel.getPopularShows()
                }
            }
        }

    }
}

#Preview {
    TVShowsView()
}
