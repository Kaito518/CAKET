//
//  TaskViewModel.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/29.
//

import Foundation
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    var isDataLoaded = false
    // Firestoreのインスタンス
    private var db = Firestore.firestore()
    
    private var listenerRegistration: ListenerRegistration?
    
    var upcomingTasks: [Task] {
        let today = Date()
        return tasks.filter { $0.startDate <= today && today <= $0.endDate }
                    .sorted { $0.endDate < $1.endDate }
    }
    
    // 今日までのタスク
    var tasksDueToday: [Task] {
        let today = Calendar.current.startOfDay(for: Date())
        return tasks.filter { task in
            today <= task.endDate && task.startDate <= today
        }
    }
    
    // 明日から1週間以内のタスク
    var tasksDueThisWeek: [Task] {
        let today = Calendar.current.startOfDay(for: Date())
        let endOfToday = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let oneWeekFromNow = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: today)!
        return tasks.filter { task in
            let taskEnd = Calendar.current.startOfDay(for: task.endDate)
            return endOfToday <= taskEnd && taskEnd < oneWeekFromNow
        }
    }
    
    // 1週間以上先のタスク
    var tasksDueBeyondThisWeek: [Task] {
        let oneWeekFromNow = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: Date())!
        return tasks.filter { task in
            let taskStart = Calendar.current.startOfDay(for: task.startDate)
            return taskStart >= oneWeekFromNow
        }
    }
    
    func subscribeToTasks() {
        if isDataLoaded { return }

        // Firestoreのリスナーを設定し、タスクの変更を監視する
        listenerRegistration = db.collection("tasks").order(by: "startDate")
            .addSnapshotListener { [weak self] (snapshot, error) in
                guard let self = self else { return }
                guard let snapshot = snapshot else {
                    print("Error fetching snapshots: \(error!)")
                    return
                }

                // ビューの再描画をトリガーする前に変更を集約する
                var newTasks: [Task] = []
                snapshot.documents.forEach { doc in
                    let data = doc.data()
                    guard let task = self.documentToTask(data: data) else {
                        return
                    }
                    newTasks.append(task)
                }

                // 一度の操作でtasks配列を更新する
                DispatchQueue.main.async {
                    self.tasks = newTasks
                    self.isDataLoaded = true
                }
            }
    }

    private func documentToTask(data: [String: Any]) -> Task? {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let content = data["content"] as? String,
              let startDate = data["startDate"] as? Timestamp,
              let endDate = data["endDate"] as? Timestamp else {
            return nil
        }
        let start = startDate.dateValue()
        let end = endDate.dateValue()
        return Task(id: id, title: title, content: content, startDate: start, endDate: end)
    }


    func unsubscribeFromTasks() {
    }

    // タスクを追加する関数
    func addTask(task: Task) {
        let db = Firestore.firestore()

        // Firestoreに新しいタスクを追加
        db.collection("tasks").addDocument(data: [
            "id": task.id,
            "title": task.title,
            "content": task.content,
            "startDate": task.startDate,
            "endDate": task.endDate
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(task.id)")
            }
        }
    }

    
//    func loadTasks() {
//        if isDataLoaded { return } // すでにデータが読み込まれていれば何もしない
//        
//        db.collection("tasks").getDocuments { (snapshot, error) in
//            self.isDataLoaded = true // データ読み込み後にtrueに設定
//            if let error = error {
//                print("Error getting documents: \(error)")
//            } else {
//                if let snapshot = snapshot {
//                    self.tasks = snapshot.documents.compactMap { doc in
//                        // ここでTaskのイニシャライザに必要な引数を渡す
//                        let data = doc.data()
//                        guard let id = data["id"] as? String,
//                              let title = data["title"] as? String,
//                              let content = data["content"] as? String,
//                              let startDate = data["startDate"] as? Timestamp,
//                              let endDate = data["endDate"] as? Timestamp else { return nil }
//
//                        // TimestampをDateに変換
//                        let start = startDate.dateValue()
//                        let end = endDate.dateValue()
//
//                        // Taskのイニシャライザを呼び出す
//                        return Task(id: id, title: title, content: content, startDate: start, endDate: end)
//                    }
//                    // タスクを特定の基準でソートする
//                    self.tasks.sort(by: { $0.startDate < $1.startDate })
//                }
//            }
//        }
//    }
    
//    // タスクを削除するメソッド
//    func deleteTask(taskID: String) {
//        // Firestoreの特定のドキュメントを指定して削除
//        db.collection("tasks").document(taskID).delete() { error in
//            if let error = error {
//                print("Error removing document: \(error)")
//            } else {
//                print("Document successfully removed!")
//                // UIを更新するために、tasks配列からも削除
//                if let index = self.tasks.firstIndex(where: { $0.id == taskID }) {
//                    self.tasks.remove(at: index)
//                }
//            }
//        }
//    }
    
    var latestTask: Task? {
        tasks.last
    }
}

//import Foundation
//
//class TaskViewModel: ObservableObject {
//    // 他のプロパティやメソッド
//
//    func addTask(title: String, description: String) {
//        let url = URL(string: "http://localhost:3000/tasks")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//
//        let task: [String: Any] = [
//            "title": title,
//            "description": description
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: task, options: [])
//
//        let Task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    // エラーをハンドリングする
//                    print("Error: \(error)")
//                }
//            } else if let data = data {
//                DispatchQueue.main.async {
//                    // 成功した場合の処理をここに書く
//                    print("Success: \(data)")
//                }
//            }
//        }
//
//        Task.resume()
//    }
//}
//
