//
//  task(1day).swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/16.
//

import SwiftUI

struct deletetask1dayView: View {
    @State private var navigateToAddTask1Week = false
    @State private var navigateToAddTask1Month = false
    @State private var presentHomeView = false
    @Environment(\.presentationMode) var presentationMode
    
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
                    .background(BlurView(style: .systemThinMaterial).opacity(0.97))
                
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 301, height: 214)
                    .background(.white)
                    .cornerRadius(25)
                    .offset(x: 0, y: 0)
                  Text("本当にこの”クエスト”を削除しますか？")
                    .font(Font.custom("Inria Serif", size: 14).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -66.50)
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 301, height: 1)
                    .overlay(
                      Rectangle()
                        .stroke(Color(red: 0.69, green: 0.67, blue: 0.67), lineWidth: 0.50)
                    )
                    .offset(x: 0, y: 58)
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 48, height: 1)
                    .overlay(
                      Rectangle()
                        .stroke(Color(red: 0.69, green: 0.67, blue: 0.67), lineWidth: 0.50)
                    )
                    .offset(x: -83, y: 0)
                    .rotationEffect(.degrees(-90))
                    
                  Text("キャンセル")
                    .font(Font.custom("Inria Serif", size: 14))
                    .foregroundColor(.black)
                    .offset(x: -73, y: 83)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                  Text("削除")
                    .font(Font.custom("Inria Serif", size: 14))
                    .foregroundColor(.black)
                    .offset(x: 81, y: 83)
                    .onTapGesture {
                        // ここで削除のロジックを実行
//                            viewModel.deleteTask(taskID: task.id) // task.idは削除するタスクのID

                            // その後画面を閉じる
                            self.presentationMode.wrappedValue.dismiss()
                    }
                  Text("このクエストを削除すると、クエスト一覧から表示されなくなります。")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -14)
                }
                .frame(width: 301, height: 214)
                
                
                Image("haguruma")
                    .resizable()
                    .frame(width: 62, height: 60)
                    .offset(x: 152.50, y: -30)
                
                    .frame(width: 393, height: 50)
                    .background(Color(red: 0.69, green: 0.90, blue: 0.99))
                    .offset(x: 0, y: -360)
                
                ZStack() {
                    VStack(alignment: .center, spacing: 0) {
                        Text("1Day")
                            .font(Font.custom("Inria Serif", size: 30))
                            .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                        
                        Rectangle()
                            .frame(height: 1.5)
                            .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                            .padding(.leading, 21)  // 左側のスペースを20pt開ける
                            .frame(maxWidth: 108)  // 最大幅を300ptに設定
                            .offset(y: 1)
                    }
                    .offset(x: -151)
                
                        Text("1Week")
                            .font(Font.custom("Inria Serif", size: 30))
                            .foregroundColor(.black)
                            .offset(x: -35.50, y: 0)
                    
                        Text("1Month")
                            .font(Font.custom("Inria Serif", size: 30))
                            .foregroundColor(.black)
                            .offset(x: 101.50, y: 0)
                    
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
                    .offset(x: -106, y: 3)
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
                            .onTapGesture {
                                presentHomeView = true // アイコンタップでtask_1day_画面を表示
                            }
                            .fullScreenCover(isPresented: $presentHomeView){
                                HomeView(viewModel: TaskViewModel())
                            }
                        
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
    
struct deletetask1dayView_Previews: PreviewProvider {
    static var previews: some View {
        deletetask1dayView()
    }
}
