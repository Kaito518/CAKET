//
//  task(1day).swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/16.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIVisualEffectView
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIViewType {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct Addtask1dayView: View {
    @State private var navigateToAddTask1Week = false
    @State private var navigateToAddTask1Month = false
    @State private var navigateToTask1WeekView = false
    @State private var navigateToTask1MonthView = false
    @State private var presentHomeView = false
    @State private var navigateToTask1DayView = false
    
    @State private var startDate = Date() // 開始日
    @State private var endDate = Date() // 終了日
    @State private var dateText = ""
    @State private var showingDatePicker = false
    
    @StateObject var viewModel = TaskViewModel()
    @State private var taskContent = ""
    
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
                
                Text("タスク追加")
                  .font(Font.custom("Noto Serif JP", size: 20))
                  .foregroundColor(.white)
                  .offset(y: -220)
                
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
                Text("タスクの内容")
                  .font(Font.custom("Noto Serif JP", size: 13))
                  .foregroundColor(.white)
                  .offset(x: -75, y: -120)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 136, height: 25)
                  .background(.white)
                  .cornerRadius(5)
                  .offset(x: 38 ,y: -120)
                
                // タスクの内容を入力するテキストフィールド
                TextField("タスクの内容を入力してください", text: $taskContent)
                    .padding(5) // テキストフィールド内全体にパディングを追加
                    .frame(width: 136, height: 25) // Rectangleのサイズに合わせる
                    .background(Color.white) // テキストフィールドの背景色を白に
                    .cornerRadius(5) // 角を丸くする
                    .foregroundColor(.black) // 入力されたテキストの色を黒にする
                    .offset(x: 38, y: -120) // Rectangleの位置に合わせる
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 241, height: 74)
                  .background(Color(red: 0.83, green: 0.46, blue: 0.20).opacity(0.88))
                  .cornerRadius(6)
                  .offset(y: -25)
                  .overlay(
                    RoundedRectangle(cornerRadius: 6)
                      .inset(by: 0.50)
                      .stroke(.black, lineWidth: 0.50)
                      .offset(y: -25)
                  )

                Text("期日")
                  .font(Font.custom("Noto Serif JP", size: 13))
                  .foregroundColor(.white)
                  .offset(x: -100, y: -25)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 145, height: 25)
                  .background(.white)
                  .cornerRadius(5)
                  .offset(x: -5 ,y: -25)
                
                // 選択された日付を表示するテキスト
                Text(dateText)
                    .font(Font.custom("Niramit", size: 13))
                    .foregroundColor(.black)
                    .offset(x: -5, y: -24)
                
                // カレンダーアイコンにタップジェスチャを追加
                Image("karender")
                    .resizable()
                    .frame(width: 31, height: 31)
                    .offset(x: 90, y: -25)
                    .onTapGesture {
                        self.showingDatePicker = true
                    }
                
                ZStack() {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 203, height: 50)
                      .background(Color(red: 0.86, green: 0.96, blue: 1))
                      .cornerRadius(12)
                
                    Text("Create")
                        .font(Font.custom("Niconne", size: 36))
                        .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                }
                .offset(y: 100)
                .onTapGesture {
                    let newTask = Task(id: UUID().uuidString, title: "タイトルをここに入れます", content: taskContent, startDate: startDate, endDate: endDate)
                        viewModel.addTask(task: newTask)
                        print("Task added: \(newTask)")

                    // 期間を計算
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.day], from: startDate, to: endDate)
                    if let days = components.day {
                        // 期間に応じて適切なビューにナビゲート
                        if days < 1 {
                            // 1日未満のタスク
                            navigateToTask1DayView = true
                        } else if days <= 7 {
                            // 1週間以内のタスク
                            navigateToTask1WeekView = true
                        } else {
                            // それ以上のタスク
                            navigateToTask1MonthView = true
                        }
                    }
                }
                
                // DatePickerをモーダルとして表示するためのシート
                .sheet(isPresented: $showingDatePicker) {
                    NavigationView {
                        VStack {
                            // 左右にpaddingを追加してDatePickerの幅を調整
                            DatePicker(
                                "開始日",
                                selection: $startDate,
                                in: Date()...,
                                displayedComponents: .date
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding(.horizontal, 20) // ここで幅を調整

                            DatePicker(
                                "終了日",
                                selection: $endDate,
                                in: startDate...,
                                displayedComponents: .date
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding(.horizontal, 20) // ここで幅を調整

                            // 完了ボタン
                            Button("完了") {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy/MM/dd"
                                dateText = formatter.string(from: startDate) + " - " +
                                           formatter.string(from: endDate)
                                showingDatePicker = false
                            }
                            .padding()
                        }
                        .navigationBarTitle(Text("日付選択"), displayMode: .inline)
                    }
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
                    navigateToTask1DayView = true
                }
                .fullScreenCover(isPresented: $navigateToTask1DayView) {
                    Task1DayView(viewModel: TaskViewModel())
                }
                
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
                    
                    Button {
                        // 遷移状態をトリガーする
                        navigateToAddTask1Week = true
                    } label: {
                        Text("1Week")
                            .font(Font.custom("Inria Serif", size: 30))
                            .foregroundColor(.black)
                            .offset(x: -35.50, y: 0)
                    }
                    .background(
                        // 実際の遷移を実行するNavigationLink
                        NavigationLink(
                            destination: Addtask1weekView() // 遷移先のビューを指定
                                .navigationBarBackButtonHidden(true), // バックボタンを非表示にする
                            isActive: $navigateToAddTask1Week // 遷移の状態バインディング
                        ) {
                            EmptyView()
                        }
                    )
                    
                    Button(action: {
                            navigateToAddTask1Month = true
                    }) {
                        Text("1Month")
                            .font(Font.custom("Inria Serif", size: 30))
                            .foregroundColor(.black)
                    }.offset(x: 101.50, y: 0)
                    .background(
                        NavigationLink("", destination: Addtask1month()
                          .navigationBarBackButtonHidden(true), isActive: $navigateToAddTask1Month)
                    )
                    
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
    
struct Addtask1dayView_Previews: PreviewProvider {
    static var previews: some View {
        Addtask1dayView()
    }
}
