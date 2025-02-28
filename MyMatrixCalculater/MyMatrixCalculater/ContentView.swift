//
//  SelectView.swift
//  MyMatrixCalculater
//
//  Created by 中川和 on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                Text("2×2行列の計算")
                NavigationLink(destination: matrix22()){}
                Text("3×3行列の計算")
                NavigationLink(destination: matrix33()){}
            }
            .navigationTitle("行列の基本計算")
        }
    }
}

struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
