import SwiftUI

struct RoundedPoster: View {

    let imageState: ImageState?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.20))

            switch imageState {
            case .success(let url):
                AsyncImage(url: url) { phase in

                    if let image = phase.image {
                        image
                            .resizable()
                            .interpolation(.low)  // ✅ improves performance with minimal visible loss
                            .scaledToFit()

                    } else if phase.error != nil {
                        FailedIcon()
                    } else {
                        ProgressView()

                    }

                }
            case .loading:
                ProgressView()

            default:
                FailedIcon()
            }

        }
        .scaledToFill()
        .frame(width: 150, height: 200)
        .cornerRadius(10)
        .clipped()
    }
}

private struct FailedIcon: View {
    var body: some View {

        Image(systemName: "exclamationmark.triangle")
            .font(.system(size: 30, weight: .medium))
            .foregroundColor(Color.gray)
    }
}
