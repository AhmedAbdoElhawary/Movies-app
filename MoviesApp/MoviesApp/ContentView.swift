//
//  ContentView.swift
//  MoviesApp
//
//  Created by ahmed elhawary on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Categories")
                    .font(.system(size: 20,weight: .medium))
                
                Spacer()
                
                Text("Expand")
                    .font(.system(size: 14,weight: .medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.7270507812, green: 0.3651237247, blue: 0.01261646681, alpha: 1)))
            }
        }
    }
}

#Preview {
    ContentView()
}
