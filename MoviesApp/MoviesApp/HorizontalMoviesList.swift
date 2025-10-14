import SwiftUI

struct HorizontalMoviesList: View {
    let url = URL(string: "https://picsum.photos/1200")

    var body: some View {
        VStack(spacing: 20) {
            GroupOfMoviesTitle(title: "Categories", subTitle: "Expand")
            CategoriesOptions()

            GroupOfMoviesTitle(title: "Latest Movies", subTitle: "View all")

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<10) { _ in
                        VStack(alignment: .leading,spacing: 0) {
                            RoundedPoster(url:url)

                            Text("Movie Name")
                                .font(.system(size: 14, weight: .medium))
                                .padding(.top,8)
                                .padding(.bottom,2)

                            HStack(spacing: 2) {
                                Image(systemName: "clock")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                                Text("114 mins")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                                Text("8.5")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(Color(#colorLiteral(red: 0.4263476563, green: 0.4263476563, blue: 0.4263476563, alpha: 1)))
                                
                            }
                        }
                    }
                }
                .frame(height: 245)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }

        }
    }
}

#Preview {
    ContentView()
}

struct RoundedPoster: View {

    let url:URL
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.20))

            AsyncImage(url: url) { phase in

                if let image = phase.image {
                    image
                        .resizable()
                        .interpolation(.low)  // ✅ improves performance with minimal visible loss
                        .scaledToFit()

                } else if phase.error != nil {

                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(Color.gray)
                } else {
                    ProgressView()

                }

            }

        }
        .scaledToFill()
        .frame(width: 150, height: 200)
        .cornerRadius(10)
        .clipped()
    }
}

#Preview {
    RoundedPoster()
}
