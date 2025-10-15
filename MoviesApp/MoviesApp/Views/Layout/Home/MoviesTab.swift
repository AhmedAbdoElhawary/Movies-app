import SwiftUI

struct MoviesView: View {
    let url = URL(string: "https://picsum.photos/1200")
@State private var moviesViewModel = MoviesViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
                CategoriesOptions()

                GroupOfMoviesTitle(title: "Latest Movies", subTitle: "View all")
                HorizontalMoviesList(url: url,moviesViewModel:$moviesViewModel)
                    .task {
                        await moviesViewModel.getLatestMovies()
                    }
                
                GroupOfMoviesTitle(title: "Top Movies", subTitle: "View all")
                HorizontalMoviesList(url: url,moviesViewModel:$moviesViewModel)

                GroupOfMoviesTitle(
                    title: "Popular Movies",
                    subTitle: "View all"
                )
                HorizontalMoviesList(url: url,moviesViewModel:$moviesViewModel)

            }
        }

    }
}

#Preview {
    MoviesView()
}
