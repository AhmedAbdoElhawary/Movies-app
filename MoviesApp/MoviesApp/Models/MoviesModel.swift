import Foundation

struct MoviesModel<T: MoviesResults> : Codable {
    let page : Int?
    let results : [T]?
    let totalPages : Int?
    let totalResults : Int?

}

class MoviesResults : Codable, Identifiable {
    let id : Int?
    let name : String?
    let title : String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Double?
    let posterPath : String?
    let releaseDate : String?
    let firstAirDate : String?
    let voteAverage : Double?

}

extension MoviesResults {
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(Constants.posterPrefixUrl)\(posterPath)")
    }

    var getRating: String? {
       return String(format: "%.1f", (voteAverage ?? 0))
       
    }
    
    var getTitle: String? {
       return title ?? name
    }
    
    var getReleaseData: String? {
       return releaseDate ?? firstAirDate
    }
}
