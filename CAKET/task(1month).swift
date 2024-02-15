//
//  task(1day).swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/16.
//

import SwiftUI


struct task_1month_: View {
    var task: Task?
    
    @State private var navigateTo1Day = false
    @State private var navigateTo1Week = false
    @State private var presentHomeView = false
    @State private var navigateToDeleteTask1Month = false
    @State private var navigateToAddTask1MonthView = false
    @State private var OptionTask1Month = false
    
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
            ZStack() {
                
                ZStack() {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.tasksDueBeyondThisWeek) { task in
                            HStack {
                                Image("board")
                                    .resizable()
                                    .frame(width: 58, height: 58)
                                Text(task.content) // タスクの内容
                                    .font(Font.custom("Noto Serif JP", size: 20))
                                    .foregroundColor(.black)
                                
                                Spacer() // 左寄せ
                                
                                Image("present") // タスクに関連する画像
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Image("gomibako") // 削除アイコン
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .onTapGesture {
                                        // 削除処理をここに実装
                                        
                                    }
                            }
                            .padding(.vertical, 4) // 上下に少し余白を追加
                            .frame(height: 58) // タスクアイテムの高さを固定
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.79, green: 0.66, blue: 0.52), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, -285)
                }
                
                ZStack() {
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
                        
                }
                .offset(x: 145, y: 280)
                .onTapGesture {
                    navigateToAddTask1MonthView = true
                }
                .fullScreenCover(isPresented: $navigateToAddTask1MonthView) {
                    Addtask1month()
                }
                
                Button(action: {
                   self.OptionTask1Month = true // モーダル表示をトリガー
                }) {
                    Image("haguruma")
                        .resizable()
                        .frame(width: 62, height: 60)
                }
                    .offset(x: 152.50, y: -25)
                
                    .frame(width: 393, height: 50)
                    .background(Color(red: 0.69, green: 0.90, blue: 0.99))
                    .offset(x: 0, y: -360)
                    .fullScreenCover(isPresented: $OptionTask1Month, content: optiontask1monthView.init)
                
                ZStack() {
                    
                        Button(action: {
                                navigateTo1Day = true
                        }) {
                            Text("1Day")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(.black)
                        }.offset(x: -151)
                        .background(
                            NavigationLink("", destination: Task1DayView(viewModel: TaskViewModel())
                              .navigationBarBackButtonHidden(true), isActive: $navigateTo1Day)
                        )
                        
                        Button {
                            // 遷移状態をトリガーする
                            navigateTo1Week = true
                        } label: {
                            Text("1Week")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(.black)
                                .offset(x: -35.50, y: 0)
                        }
                        .background(
                            // 実際の遷移を実行するNavigationLink
                            NavigationLink(
                                destination: task_1week_(viewModel: TaskViewModel()) // 遷移先のビューを指定
                                    .navigationBarBackButtonHidden(true), // バックボタンを非表示にする
                                isActive: $navigateTo1Week // 遷移の状態バインディング
                            ) {
                                EmptyView()
                            }
                        )
                    
                        VStack(alignment: .center, spacing: 0) {
                            Text("1Month")
                                .font(Font.custom("Inria Serif", size: 30))
                                .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                            
                            Rectangle()
                                .frame(height: 1.5)
                                .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
                                .padding(.leading, 27)  // 左側のスペースを20pt開ける
                                .frame(maxWidth: 152)  // 最大幅を300ptに設定
                                .offset(y: 1)
                        }
                        .offset(x: 101.50, y: 0)
                        
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
                                    .stroke(Color(red: 0.38, green: 0.81, blue: 0.99), lineWidth: 0.50)
                            )
                            .offset(x: 0, y: 0)
                        Text("6")
                            .font(Font.custom("Inria Serif", size: 28))
                            .foregroundColor(Color(red: 0.38, green: 0.81, blue: 0.99))
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
    
struct task_1month__Previews: PreviewProvider {
    static var previews: some View {
        task_1month_(viewModel: TaskViewModel())
    }
}
