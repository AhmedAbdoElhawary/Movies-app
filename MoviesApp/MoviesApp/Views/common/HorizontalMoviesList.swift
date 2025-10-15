import SwiftUI

struct HorizontalMoviesList<T: MoviesResults>: View  {
    @Binding var loadableState: LoadableState<MoviesModel<T>>
    var initailRequest: () async -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                switch loadableState {
                case .idle:
                    MoviesListFailed()
                        .onAppear { Task {await initailRequest()} }
                case .loading:
                    MoviesListLoading()
                case .success(let movies):
                    MoviesList(moviesModel: movies.results ?? [])
                case .failure:
                MoviesListFailed()
                }

           
            }
            .frame(height: 245)
                .padding(.leading, 10)
                .padding(.trailing, 10)
        }
    }
}

struct MoviesList: View {
     var moviesModel: [MoviesResults]

    var body: some View {
        ForEach(moviesModel) { movie in
            Movie( imageState:ImageState.success(movie.posterURL), title:movie.getTitle, rating:movie.getRating, releaseDate:movie.getReleaseData )
        }
   
    }
}

struct MoviesListLoading: View {
    var body: some View {
        ForEach(0..<5) { _ in
            Movie( imageState:ImageState.loading, title:nil, rating:nil, releaseDate:nil )
        }
    }
}
struct MoviesListFailed: View {
    var body: some View {
        ForEach(0..<5) { _ in
            Movie( imageState:ImageState.failure, title:nil, rating:nil, releaseDate:nil )
        }
    }
}

struct Movie: View {
    let imageState:ImageState?
    let title:String?
    let rating:String?
    let releaseDate:String?
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            RoundedPoster(imageState:imageState)

            Text(title ?? "Unknown")
                .font(.system(size: 14, weight: .medium))
                .padding(.top,8)
                .padding(.bottom,2)

            HStack(spacing: 2) {
                Image(systemName: "clock")
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                Text(releaseDate ?? "NN")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                Text(rating ?? "NR")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                
            }
        }.frame(width: 150)
    }
}

#Preview {
    MoviesView()
}
