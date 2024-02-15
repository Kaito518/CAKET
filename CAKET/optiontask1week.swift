//
//  task(1day).swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/16.
//

import SwiftUI

struct optiontask1weekView: View {
    @State private var navigateToAddTask1Week = false
    @State private var navigateToAddTask1Month = false
    @State private var navigateToTopView = false
    @State private var navigateToTask1DayView = false
    @State private var navigateTo1Month = false
    @State private var navigateToTask1WeekView = false
    
    var body: some View {
        NavigationView {
            ZStack() {
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 190, height: 1)
                        .overlay(
                            Rectangle()
                                .stroke(Color(red: 0.57, green: 0.41, blue: 0.22), lineWidth: 0.50)
                        )
                        .offset(x: -24, y: -160)
                        .opacity(0.30)
                    
                    Image("present")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 105, y: -165)
                    
                    Image("gomibako")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .offset(x: 155, y: -165)
                    
                    Image("board")
                        .resizable()
                        .frame(width: 58, height: 58)
                        .offset(x: -153.50, y: 1)
                    
                        .frame(width: 369, height: 78)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 1)
                                .stroke(Color(red: 0.79, green: 0.66, blue: 0.52), lineWidth: 1)
                        )
                        .offset(x: -0.50, y: -250)
                }
                
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 190, height: 1)
                        .overlay(
                            Rectangle()
                                .stroke(Color(red: 0.57, green: 0.41, blue: 0.22), lineWidth: 0.50)
                        )
                        .offset(x: -25, y: -250)
                        .opacity(0.30)
                    
                    Image("present")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 105, y: -255)
                    
                    Text("ログイン画面作成")
                        .font(Font.custom("Noto Serif JP", size: 20))
                        .foregroundColor(.black)
                        .offset(x: -40, y: -265)
                    
                    Image("gomibako")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .offset(x: 153, y: -255)
                    
                    Image("board")
                        .resizable()
                        .frame(width: 58, height: 58)
                        .offset(x: -153.50, y: 1)
                    
                        .frame(width: 369, height: 78)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 1)
                                .stroke(Color(red: 0.79, green: 0.66, blue: 0.52), lineWidth: 1)
                        )
                        .offset(x: -0.50, y: -160)
                    
                }
                
                ZStack {
                    // 円の描画
                    Circle()
                        .fill(Color(red: 0.66, green: 0.90, blue: 1))
                        .frame(width: 61, height: 61)
                        .overlay(
                            // プラス記号の横棒
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 30, height: 5)
                        )
                        .overlay(
                            // プラス記号の縦棒
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 5, height: 30)
                        )
                        .offset(x: 145, y: 280)
                }
                
                Rectangle()
                    .fill(Color.clear) // 完全に透明
                    .frame(width: 400, height: 640)
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
                    navigateToTask1WeekView = true
                }
                .fullScreenCover(isPresented: $navigateToTask1WeekView) {
                    task_1week_(viewModel: TaskViewModel())
                }
                
                Image("haguruma")
                    .resizable()
                    .frame(width: 62, height: 60)
                    .offset(x: 152.50, y: -30)
                
                    .frame(width: 393, height: 50)
                    .background(Color(red: 0.69, green: 0.90, blue: 0.99))
                    .offset(x: 0, y: -360)
                
                ZStack() {
                        Button(action: {
                            navigateToTask1DayView = true
                        }) {
                            Text("1Day")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(.black)
                        }.offset(x: -151)
                        .background(
                            NavigationLink("", destination: Task1DayView(viewModel: TaskViewModel())
                              .navigationBarBackButtonHidden(true), isActive: $navigateToTask1DayView)
                        )
                        
                        VStack(alignment: .center, spacing: 0) {
                            Text("1Week")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                                
                            Rectangle()
                                .frame(height: 1.5)
                                .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                                .padding(.leading, 28)  // 左側のスペースを開ける
                                .frame(maxWidth: 140)
                                .offset(y: 1)
                        }
                        .offset(x: -35.50 , y: 1.5)
                        
                        Button(action: {
                                navigateTo1Month = true
                        }) {
                            Text("1Month")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(.black)
                        }.offset(x: 101.50, y: 0)
                        .background(
                            NavigationLink("", destination: task_1month_(viewModel: TaskViewModel())
                              .navigationBarBackButtonHidden(true), isActive: $navigateTo1Month)
                        )
                    
                        ZStack() {
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .overlay(
                                    Ellipse()
                                        .inset(by: 0.50)
                                        .stroke(.black, lineWidth: 0.50)
                                )
                                .offset(x: 0, y: 0)
                            Text("6")
                                .font(Font.custom("Inria Serif", size: 28))
                                .foregroundColor(.black)
                                .offset(x: -0.50, y: 0)
                        }
                        .frame(width: 30, height: 30)
                        .offset(x: -106, y: 3)
                        ZStack() {
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .overlay(
                                    Ellipse()
                                        .inset(by: 0.50)
                                        .stroke(Color(red: 0.38, green: 0.81, blue: 0.99), lineWidth: 0.50)
                                )
                                .offset(x: 0, y: 0)
                            Text("6")
                                .font(Font.custom("Inria Serif", size: 28))
                                .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                                .offset(x: -0.50, y: 0)
                        }
                        .frame(width: 30, height: 30)
                        .offset(x: 24, y: 0)
                        ZStack() {
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .overlay(
                                    Ellipse()
                                        .inset(by: 0.50)
                                        .stroke(.black, lineWidth: 0.50)
                                )
                                .offset(x: 0, y: 0)
                            Text("6")
                                .font(Font.custom("Inria Serif", size: 28))
                                .foregroundColor(.black)
                                .offset(x: -0.50, y: 0)
                        }
                        .frame(width: 30, height: 30)
                        .offset(x: 166, y: 0)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 94, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.38, green: 0.81, blue: 0.99), lineWidth: 0.50)
                            )
                            .offset(x: -138, y: 17.50)
                    }
                    .frame(width: 392, height: 53)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                            .offset(x: 0, y: 30)
                    )
                    .offset(x: 0, y: -330)
                
                ZStack {
                    // 四角形の背景
                    Rectangle()
                        .fill(Color(hex: "DBF4FF"))
                        .frame(width: 400, height: 100) // 必要に応じてサイズを調整してください
                        .offset(y: 370)
                    
                    // アイコンを配置
                    HStack(spacing: 50) { // アイコンの間隔は適宜調整してください
                        Image("home")
                            .resizable()
                            .frame(width: 76, height: 66)
                            .offset(x: 7, y: 5)
                        
                        
                        Image("kanban")
                            .resizable()
                            .frame(width: 93, height: 94)
                            .offset(x: 0, y: 5)
                        
                        Image("karender")
                            .resizable()
                            .frame(width: 73, height: 73)
                            .offset(x: -7, y: 5)
                    }
                    .offset(y: 360)
                }
            }
        }
    }
}
    
struct optiontask1weekView_Previews: PreviewProvider {
    static var previews: some View {
        optiontask1weekView()
    }
}
