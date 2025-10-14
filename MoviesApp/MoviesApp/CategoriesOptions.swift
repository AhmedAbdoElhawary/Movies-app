import SwiftUI

struct CategoriesOptions: View {
    let categoriesTitles: [String] = [
        "Action", "Comedy", "Drama", "Horror", "Thriller", "Fantasy",
        "Science Fiction", "Romance", "Documentary", "Crime", "Adventure",
        "Mystery", "Family", "Historical", "Superhero", "Musical", "Sports",
        "Western", "Animated", "Live Action",
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                ForEach(Array(categoriesTitles.enumerated()), id: \.offset) { index, title in
                    Text(title)
                        .font(.system(size: 14))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.gray.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.leading, index == 0 ? 10 : 0)
                        .padding(.trailing, index == categoriesTitles.count - 1 ? 10 : 0)
                }
            }
        }
    }
}

#Preview {
    CategoriesOptions()
}
