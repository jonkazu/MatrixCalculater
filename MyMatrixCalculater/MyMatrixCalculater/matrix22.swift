//
//  ContentView.swift
//  MyMatrixCalculater
//
//  Created by 中川和 on 2022/12/09.
//

import SwiftUI
import UIKit

func add(v1:inout [[Double]] ,v2:inout [[Double]])->[[Double]] {
    var v3 = [[Double]](repeating: [Double](repeating: 0, count: 2), count: 2)
    for i in 0 ... 1 {
       for j in 0 ... 1 {
           v3[i][j]=v1[i][j]+v2[i][j]
       }
    }
    return v3
}

func sub(v1:inout [[Double]] ,v2:inout [[Double]])->[[Double]] {
    var v3 = [[Double]](repeating: [Double](repeating: 0, count: 2), count: 2)
    for i in 0 ... 1 {
       for j in 0 ... 1 {
           v3[i][j]=v1[i][j]-v2[i][j]
       }
    }
    return v3
}

func mul(v1:inout [[Double]] ,v2:inout [[Double]])->[[Double]] {
    var v3 = [[Double]](repeating: [Double](repeating: 0, count: 2), count: 2)
    for i in 0 ... 1 {
       for j in 0 ... 1 {
           for k in 0 ... 1{
               v3[i][j]+=v1[i][k]*v2[k][j]
           }
       }
    }
    return v3
}

func inverse(v:inout [[Double]])->[[Double]] {
    var v3 = [[Double]](repeating: [Double](repeating: 0, count: 2), count: 2)
    for i in 0 ... 1 {
       for j in 0 ... 1 {
           if j==i{
               v3[i][j] = v[(i+1)%2][(j+1)%2]/(v[0][0]*v[1][1]-v[0][1]*v[1][0])
           }else{
               v3[i][j] = -1*v[(i+1)%2][(j+1)%2]/(v[0][0]*v[1][1]-v[0][1]*v[1][0])
           }
       }
    }
    return v3
}


struct ContentView: View {
    
    @State var v1 = [[Double]](repeating: [Double](repeating: 10, count: 2), count: 2)
    @State var v2 = [[Double]](repeating: [Double](repeating: 10, count: 2), count: 2)
    @State var v3 = [[Double]](repeating: [Double](repeating: 0, count: 2), count: 2)
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                //一つ目の行列を入力
                VStack{
                    
                    TextField("", value: $v1[0][0],format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                    
                    TextField("", value: $v1[1][0],format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                }//VStack終わり
                VStack{
                    
                    TextField("", value: $v1[0][1],format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                    
                    TextField("", value: $v1[1][1],format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                }//VStack終わり
                
                Spacer()
                
                //二つ目の行列を入力
                VStack{
                    
                    TextField("", value: $v2[0][0], format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                    
                    TextField("", value: $v2[1][0], format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                }//VStack終わり
                VStack{
                    
                    TextField("", value: $v2[0][1], format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                    
                    TextField("", value: $v2[1][1], format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .frame(width: 50)
                }//VStack終わり
                Spacer()
            }//HStack終わり
            Spacer()
            HStack{
                Spacer()
                //足し算
                Button("足し算") {
                    v3=add(v1:&v1 ,v2:&v2)
                }
                Spacer()
                //引き算
                Button("引き算") {
                    v3=sub(v1:&v1 ,v2:&v2)
                }
                Spacer()
                //掛け算
                Button("掛け算") {
                    v3=mul(v1:&v1 ,v2:&v2)
                }
                Spacer()
            }//HStack終わり
            .padding()
            HStack{
                Spacer()
                //左の行列の逆行列
                Button("左の行列の逆行列") {
                    v3=inverse(v:&v1)
                }
                Spacer()
                //右の行列の逆行列
                Button("右の行列の逆行列") {
                    v3=inverse(v:&v2)
                }
                Spacer()
            }//HStack終わり
            Spacer()
            HStack{
                //結果を出力
                VStack{
                    
                    Text(String(format: "%.2f",round(v3[0][0]*100)/100))
                    Text(String(format: "%.2f",round(v3[1][0]*100)/100))
                }//VStack終わり
                VStack{
                    Text(String(format: "%.2f",round(v3[0][1]*100)/100))
                    Text(String(format: "%.2f",round(v3[1][1]*100)/100))
                }//VStack終わり
            }//HStack終わり
            Spacer()
        }//VStack終わり
    }
        
}
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
