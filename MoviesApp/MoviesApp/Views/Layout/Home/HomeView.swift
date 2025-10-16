import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            Picker("Tabs", selection: $selectedTab) {
                Text("Movies").tag(0)
                Text("TV Shows").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()

            // The content below changes with tab
            // Swipeable tab content
            TabView(selection: $selectedTab) {
                MoviesView()
                    .tag(0)

                TVShowsView()
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
        }
    }
}


#Preview {
    HomeView()
}
