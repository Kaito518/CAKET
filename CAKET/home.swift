//
//  main.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/11.
//

import SwiftUI

import WatchConnectivity

class iPhoneConnectivityProvider: NSObject, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }

    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func sendMessage(message: [String: Any]) {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(message, replyHandler: nil) { error in
                print(error.localizedDescription)
            }
        }
    }
    
    // WCSessionDelegate methods...
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct HomeView: View {
    @State private var presentTask1Day = false
    @State private var presentCalendarView = false
    @State private var walkAnimation = false
    @State private var OptionHome = false
    
    let penguinImages = ["small_pengin", "rightpengin"]  // ペンギンの画像名
    @State private var imageIndex = 0 // 表示する画像のインデックス
    
    let penguinMessages = ["こんにちは！", "今日もいい天気ですね！", "お腹がペコペコです！", "あなたのお名前は？", "今は何をしているの？"]
    
    @State private var currentMessage = "こんにちは！" // 初期のメッセージ
    
    // 再利用するためにアニメーションを定義
    let walkCycle = Animation.linear(duration: 0.5).repeatForever(autoreverses: true)
    // ペンギンの画像に適用するアニメーションのトリガー
    @State private var swingAnimation = false
    
    @State private var isPenguinJumping = false
    
    @State private var userMessage: String = "" // ユーザーの入力メッセージ
    @State private var showMessageField = false // メッセージ入力フィールドを表示するかどうか
    
    @ObservedObject var viewModel: TaskViewModel
    
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
                self.OptionHome = true // モーダル表示をトリガー
            }) {
                // 設定画像
                Image("haguruma")
                    .resizable()
                    .frame(width: 62, height: 60)
            }
            .offset(x: 152.50, y: -388)
            .fullScreenCover(isPresented: $OptionHome, content: optionhome.init)
            
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
                
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.upcomingTasks.prefix(2)) { task in
                        Text("・\(task.content) \(formatDate(task.startDate)) - \(formatDate(task.endDate))")
                            .font(Font.custom("Inria Serif", size: 15))
                            .foregroundColor(.white)
                    }
                }
                .offset(x: 0, y: -275)

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
            
            // ペンギンの画像に適用するジェスチャー
            let doubleTapGesture = TapGesture(count: 2)
                .onEnded {
                    withAnimation {
                        self.isPenguinJumping = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.isPenguinJumping = false
                        }
                    }
                }
            
            let singleTapGesture = TapGesture()
                .onEnded {
                    withAnimation {
                        self.showMessageField.toggle()
                    }
                }
            
            // ペンギンの画像ビュー
            Image(penguinImages[imageIndex])
                .resizable()
                .frame(width: 181.82, height: 334.09)
            // より高くジャンプ
                .offset(x: swingAnimation ? 40 : -40, y: isPenguinJumping ? -100 : 120)
            
            // simultaneousGestureではなくexclusiveGestureを使用
                .gesture(
                    ExclusiveGesture(doubleTapGesture, singleTapGesture)
                )
            
                .onAppear {
                    // アニメーションのトリガーを設定
                    swingAnimation.toggle()
                    
                    let timer = Timer(timeInterval: 1, repeats: true) { _ in // アニメーションの間隔を短くした
                        withAnimation(walkCycle) {
                            self.swingAnimation.toggle()
                        }
                        self.imageIndex = self.imageIndex == 0 ? 1 : 0
                    }
                    RunLoop.current.add(timer, forMode: .common)
                }
            
            Image("fukidashi") // 吹き出しの背景画像
                .resizable()
                .frame(width: 150, height: 90)
                .overlay(
                    Text(currentMessage)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 120, height: 50) // 吹き出しと同じサイズに設定
                )
                .position(x: 300, y: 435) // 吹き出しの位置調整
            
                .onAppear {
                    // タイマーをセットしてメッセージを更新
                    let messageChangeTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                        self.currentMessage = penguinMessages.randomElement() ?? "こんにちは！"
                    }
                    messageChangeTimer.fire()
                }
            
            if showMessageField {
                VStack {
                    TextField("メッセージを入力してください", text: $userMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("送信") {
                        currentMessage = userMessage // ペンギンがメッセージを受け取る
                        userMessage = "" // メッセージフィールドをクリア
                        showMessageField = false // メッセージフィールドを非表示に
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.opacity(0.9))
                .transition(.move(edge: .bottom))
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
                .frame(width: 400, height: 120) // 必要に応じてサイズを調整してください
                .offset(y: 355)
            
            // アイコンを配置
            HStack(spacing: 50) { // アイコンの間隔は適宜調整してください
                Image("home")
                    .resizable()
                    .frame(width: 76, height: 66)
                    .offset(x: 7, y: -15)
                
                Image("kanban")
                    .resizable()
                    .frame(width: 93, height: 94)
                    .offset(x: 0, y: -15)
                    .onTapGesture {
                        presentTask1Day = true // アイコンタップでtask_1day_画面を表示
                    }
                    .fullScreenCover(isPresented: $presentTask1Day) {
                        // Task1DayViewが表示される直前に初期化されるようにする
                        Task1DayView(viewModel: TaskViewModel())
                    }
                
                Image("karender")
                    .resizable()
                    .frame(width: 73, height: 73)
                    .offset(x: -7, y: -15)
//                    .onTapGesture {
//                        presentCalendarView = true // アイコンタップでtask_1day_画面を表示
//                    }
//                    .fullScreenCover(isPresented: $presentCalendarView){
////                        CalendarView()
//                    }
            }
            .offset(y: 360)
        }
            .background(Color(red: 1, green:1, blue: 1).opacity(0.91))
        }
//        .edgesIgnoringSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
        .statusBar(hidden: true)
    }
}

// 日付をフォーマットする関数
func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd"
    return formatter.string(from: date)
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: TaskViewModel())
    }
}
