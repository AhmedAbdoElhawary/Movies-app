import SwiftUI

struct TVShowsView: View {
    let url = URL(string: "https://picsum.photos/1200")

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
                CategoriesOptions()

                GroupOfMoviesTitle(title: "Latest Shows", subTitle: "View all")
                HorizontalMoviesList(url: url)

                GroupOfMoviesTitle(title: "Top Shows", subTitle: "View all")
                HorizontalMoviesList(url: url)

                GroupOfMoviesTitle(title: "Popular Shows", subTitle: "View all")
                HorizontalMoviesList(url: url)

            }
        }

    }
}

#Preview {
    TVShowsView()
}
