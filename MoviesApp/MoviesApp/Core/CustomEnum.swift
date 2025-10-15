import Foundation

enum LoadableState<T>{
    case idle
    case loading
    case success(T)
    case failure(String)
}
enum ImageState{
    case idle
    case loading
    case success(URL?)
    case failure
}
