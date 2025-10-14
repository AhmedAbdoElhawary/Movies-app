import SwiftUI

struct MoviesView: View {
    let url = URL(string: "https://picsum.photos/1200")

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
                CategoriesOptions()

                GroupOfMoviesTitle(title: "Latest Movies", subTitle: "View all")
                HorizontalMoviesList(url: url)

                GroupOfMoviesTitle(title: "Top Movies", subTitle: "View all")
                HorizontalMoviesList(url: url)

                GroupOfMoviesTitle(
                    title: "Popular Movies",
                    subTitle: "View all"
                )
                HorizontalMoviesList(url: url)

            }
        }

    }
}

#Preview {
    MoviesView()
}
