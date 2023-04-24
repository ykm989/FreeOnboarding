//
//  main.swift
//  MyCreditManager
//
//  Created by 김경호 on 2023/04/22.
//

import Foundation

print("Hello, World!")

var continueFlag : Bool = true
var studentInfo = [String:[String:String]]()

while continueFlag{
    print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    var inputValue = readLine()
    if ["1","2","3","4","5","X"].contains(inputValue){
        switch inputValue{
        case "1":
            print("추가할 학생의 이름을 입력해주세요")
            var studentName: String = readLine()!
            
            if studentName.isEmpty{
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else if studentInfo.keys.contains(studentName){
                print("\(studentName)는 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else {
                studentInfo.updateValue([:], forKey: studentName)
                print("\(studentName) 학생을 추가합니다.")
            }
        case "2":
            print("삭제할 학생의 이름을 입력해주세요")
            var studentName: String = readLine()!
            
            if studentName.isEmpty{
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else if !studentInfo.keys.contains(studentName){
                print("\(studentName) 학생을 찾지 못했습니다.")
            }
            
            else {
                studentInfo[studentName] = nil
                print("\(studentName) 학생을 삭제했습니다.")
            }
        case "3":
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            var inputInfo = readLine()!.split(separator: " ")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            
            if inputInfo.isEmpty || inputInfo.count != 3 || !studentInfo.keys.contains(String(inputInfo[0])) || !["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"].contains(String(inputInfo[2])){
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else {
                studentInfo[String(inputInfo[0])]?.updateValue(String(inputInfo[2]), forKey: String(inputInfo[1]))
                print("\(inputInfo[0]) 학생의 \(inputInfo[1]) 과목이 \(inputInfo[2])로 추가(변경)되었습니다.")
            }
        case "4":
            var inputInfo = readLine()!.split(separator: " ")
            
            if inputInfo.isEmpty || inputInfo.count != 2{
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else if !studentInfo.keys.contains(String(inputInfo[0])){
                print("\(inputInfo[0]) 학생을 찾지 못했습니다.")
            } else if !(studentInfo[String(inputInfo[0])]?.keys.contains(String(inputInfo[1])))!{
                print("\(inputInfo[0]) 학생의 \(inputInfo[1]) 성적은 존재하지 않습니다.")
            } else {
                studentInfo[String(inputInfo[0])]![String(inputInfo[1])] = nil
            }
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요.")
            var studentName: String = readLine()!
            
            if studentName.isEmpty{
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            } else if !studentInfo.keys.contains(studentName){
                print("\(studentName) 학생을 찾지 못했습니다.")
            } else {
                var subjectList = studentInfo[studentName]!
                var sum = 0.0
                
                for i in subjectList{
                    print("\(i.key): \(i.value)")
                    
                    switch i.value{
                    case "A+":
                        sum += 4.5
                    case "A":
                        sum += 4.0
                    case "B+":
                        sum += 3.5
                    case "B":
                        sum += 3.0
                    case "C+":
                        sum += 2.5
                    case "C":
                        sum += 2.0
                    case "D+":
                        sum += 1.5
                    case "D":
                        sum += 1.0
                    case "F":
                        sum += 0
                    default:
                        print("잘못된 값이 들어왔습니다.")
                    }
                }
                
                print("평점 : \(sum / Double(subjectList.count))")
            }
            
            
        case "X":
            print("프로그램을 종료합니다...")
            continueFlag = false
            
            
            
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            
        }
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    
}

