//
//  top.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/11.
//

import SwiftUI

struct topView: View {
    @State private var isShowingLogin = false // ログイン画面を表示するかどうかの状態を保持

    var body: some View {
        NavigationView {
            VStack(spacing: 65.29) {
                // 他のコンテンツ
                
                ZStack {
                    // 背景の色を最背面に設定
                    Color(red: 0.63, green: 0.89, blue: 0.91)
                        .cornerRadius(36)
                        .frame(width: 393, height: 945)

                    VStack(spacing: 65.29) {
                        ZStack {
                            // 背面に配置する透明感のあるテキスト
                            Text("CAKET")
                                .font(Font.custom("Montaga", size: 64))
                                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.2, opacity: 0.3))
                                .offset(y: 46)
                            
                            // 前面に配置する黒いテキスト
                            Text("CAKET")
                                .font(Font.custom("Montaga", size: 64))
                                .foregroundColor(.black)
                                .offset(x: 1, y: 40)
                        }
                        .frame(width: 282.39, height: 72.71)

                        // ペンギン画像
                        Image("small_pengin")
                            .resizable()
                            .frame(width: 300, height: 550)
                            .offset(y:-110)
                    }
                    
                    // タップ可能領域を設定
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle()) // タップ可能形状をRectangleで指定
                        .onTapGesture {
                            self.isShowingLogin.toggle() // タップでログイン画面の表示を切り替え
                        }
                }
                .padding(EdgeInsets(top: 174, leading: 10, bottom: 108, trailing: 11))
                .fullScreenCover(isPresented: $isShowingLogin) {
                    login() // ログイン画面をモーダルとして表示
                }
            }
        }
    }
}

struct top_Previews: PreviewProvider {
    static var previews: some View {
        topView()
    }
}
