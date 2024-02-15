//
//  main.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/11.
//

import SwiftUI

struct optionhome: View {
    @State private var presentTask1Day = false
    @State private var walkAnimation = false
    @State private var OptionTask1Day = false
    @State private var navigateToHomeView = false
    @State private var navigateToTopView = false
    
    let penguinImages = ["small_pengin", "rightpengin"]  // ペンギンの画像名
    @State private var imageIndex = 0 // 表示する画像のインデックス
    // 再利用するためにアニメーションを定義
    let walkCycle = Animation.linear(duration: 0.5).repeatForever(autoreverses: true)
    // ペンギンの画像に適用するアニメーションのトリガー
    @State private var swingAnimation = false
    
    func formattedDate() -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy年MM月dd日"
       return formatter.string(from: Date())
    }

    var body: some View {
        NavigationView {
            ZStack {
                // 背景画像
                Image("haikei")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Button(action: {
                   self.OptionTask1Day = true // モーダル表示をトリガー
                }) {
                    // 設定画像
                    Image("haguruma")
                        .resizable()
                        .frame(width: 62, height: 60)
                }
                .offset(x: 152.50, y: -400)
                .fullScreenCover(isPresented: $OptionTask1Day, content: optiontask1dayView.init)
                
                // 看板
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 336, height: 220)
                        .background(
                            Image("keiji")
                                .resizable()
                        )
                        .offset(x: 0, y: -270)
                    Text("期限が近いクエスト一覧")
                        .font(Font.custom("Inria Serif", size: 15))
                        .foregroundColor(.white)
                        .offset(x: 8.82, y: -300)
                    Text("・JavaScriptの基礎勉強　本日まで")
                        .font(Font.custom("Inria Serif", size: 15))
                        .foregroundColor(.white)
                        .offset(x: 2, y: -275)
                    Text("・過去問道場一年分　明後日まで")
                        .font(Font.custom("Inria Serif", size: 15))
                        .foregroundColor(.white)
                        .offset(x: -3.50, y: -247)
                    Text(formattedDate())
                        .font(Font.custom("Inria Serif", size: 20))
                        .foregroundColor(.white)
                        .offset(x: -3, y: -370)
                }
                
                // 雲
                Image("kumo")
                    .resizable()
                    .frame(width: 186, height: 126)
                    .offset(x: -63.50, y: -85)
                
                // 太陽
                Image("taiyou")
                    .resizable()
                    .frame(width: 118, height: 102)
                    .offset(x: 115.50, y: -97)
                
                // ペンギン
                Image(penguinImages[imageIndex])
                    .resizable()
                    .frame(width: 181.82, height: 334.09)
                    .offset(x: swingAnimation ? 20 : -20, y: walkAnimation ? 150 : 120) // 左右の振幅を増やした
                    .animation(walkCycle, value: swingAnimation)
                    .onAppear {
                        swingAnimation.toggle()

                        let timer = Timer(timeInterval: 1, repeats: true) { _ in // アニメーションの間隔を短くした
                            withAnimation(walkCycle) {
                                self.swingAnimation.toggle()
                            }
                            self.imageIndex = self.imageIndex == 0 ? 1 : 0
                        }
                        RunLoop.current.add(timer, forMode: .common)
                    }
                
                Rectangle()
                    .fill(Color.clear) // 完全に透明
                    .frame(width: 400, height: 720)
                    .background(BlurView(style: .systemThinMaterial).opacity(0.9))
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 340, height: 446)
                  .background(Color(red: 0.83, green: 0.46, blue: 0.20).opacity(0.88))
                  .cornerRadius(5)
                  .offset(y: -36)
                
                Text("オプション")
                  .font(Font.custom("Noto Serif JP", size: 20))
                  .foregroundColor(.white)
                  .offset(y: -215)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 289, height: 350)
                  .background(.white)
                  .offset(y: -13)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 241, height: 74)
                  .background(Color(red: 0.83, green: 0.46, blue: 0.20).opacity(0.88))
                  .cornerRadius(6)
                  .offset(y: -120)
                  .overlay(
                    RoundedRectangle(cornerRadius: 6)
                      .inset(by: 0.50)
                      .stroke(.black, lineWidth: 0.50)
                      .offset(y: -120)
                  )
                Text("キャラ名変更")
                  .font(Font.custom("Noto Serif JP", size: 13))
                  .foregroundColor(.white)
                  .offset(x: -75, y: -120)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 92, height: 25)
                  .background(.white)
                  .cornerRadius(5)
                  .offset(x: 15 ,y: -120)

                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 40, height: 26)
                  .background(Color(red: 0.99, green: 0.30, blue: 0.30))
                  .cornerRadius(5)
                  .offset(x: 90 ,y: -120)
                
                Text("変更")
                  .font(Font.custom("Noto Serif JP", size: 13))
                  .foregroundColor(.white)
                  .offset(x: 90 ,y: -120)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 203, height: 50)
                        .background(Color(red: 0.86, green: 0.96, blue: 1))
                        .cornerRadius(12)
                    
                    Text("Log out")
                        .font(Font.custom("Niconne", size: 40))
                        .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                }
                .offset(y: 100)
                .onTapGesture {
                    navigateToTopView = true
                }
                .fullScreenCover(isPresented: $navigateToTopView) {
                    topView()
                }
                
                ZStack {
                    // 円の描画
                    Circle()
                        .fill(Color(red: 0.99, green: 0.30, blue: 0.30))
                        .frame(width: 50, height: 50)

                    // バツ記号の１本目（左上から右下）
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 26, height: 5)
                        .rotationEffect(.degrees(45)) // 45度回転

                    // バツ記号の2本目（右上から左下）
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 26, height: 5)
                        .rotationEffect(.degrees(-45)) // -45度回転
                }
                .offset(x: 127, y: -225)
                .onTapGesture {
                    navigateToHomeView = true
                }
                .fullScreenCover(isPresented: $navigateToHomeView) {
                    HomeView(viewModel: TaskViewModel())
                }
                
//                // ネクタイ
//                Image("small_nekutai")
//                    .resizable()
//                    .frame(width: 181.82, height: 334.09)
//                    .offset(x: 3, y: 105)
//                
//                // 帽子
//                Image("small_hat")
//                    .resizable()
//                    .frame(width: 181.82, height: 334.09)
//                    .offset(x: 3, y: 100)
                
                    // 四角形の背景
                    Rectangle()
                        .fill(Color(hex: "DBF4FF"))
                        .frame(width: 400, height: 90) // 必要に応じてサイズを調整してください
                        .offset(y: 360)
                    
                    // アイコンを配置
                    HStack(spacing: 50) { // アイコンの間隔は適宜調整してください
                        Image("home")
                            .resizable()
                            .frame(width: 76, height: 66)
                            .offset(x: 7, y: 0)
                        
                        Image("kanban")
                            .resizable()
                            .frame(width: 93, height: 94)
                            .offset(x: 0, y: 0)
                            .onTapGesture {
                                presentTask1Day = true // アイコンタップでtask_1day_画面を表示
                            }
                            .fullScreenCover(isPresented: $presentTask1Day){
                                Task1DayView(viewModel: TaskViewModel())
                            }
                        
                        Image("karender")
                            .resizable()
                            .frame(width: 73, height: 73)
                            .offset(x: -7, y: 0)
                    }
                    .offset(y: 360)
            }
            .background(Color(red: 1, green:1, blue: 1).opacity(0.91))
        }
        .edgesIgnoringSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    
struct optionhome_Previews: PreviewProvider {
    static var previews: some View {
        optionhome()
    }
}
