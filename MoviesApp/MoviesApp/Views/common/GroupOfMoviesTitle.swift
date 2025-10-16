import SwiftUI

struct GroupOfMoviesTitle: View {
    let title: String
    let subTitle: String
    
    var body: some View {
  
            HStack {
                Text(title)
                    .font(.system(size: 20,weight: .medium))
                
                Spacer()
                
                Text(subTitle)
                    .font(.system(size: 14,weight: .medium))
//                    .foregroundColor(Color(#colorLiteral(red: 0.7270507812, green: 0.3651237247, blue: 0.01261646681, alpha: 1)))
            }
            .padding(.top,20)
            .padding(.horizontal,10)
        
    }
}

#Preview {
    GroupOfMoviesTitle(title: "Title", subTitle: "SubTitle")
}
