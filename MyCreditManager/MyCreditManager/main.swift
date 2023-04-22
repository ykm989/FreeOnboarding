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
    print("원하는 기능을 선택해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    var inputValue = readLine()
    if ["1","2","3","4","5","X"].contains(inputValue){
        switch inputValue{
        case "1":
            var studentName: String = readLine()!
            
            if !studentName.isEmpty{
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else if studentInfo.keys.contains(studentName){
                print("\(inputValue)는 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else {
                studentInfo.updateValue([:], forKey: studentName)
                print("\(inputValue) 학생을 추가합니다.")
            }
        case "2":
            var studentName: String = readLine()!
            
            if !studentName.isEmpty || studentInfo.keys.contains(studentName){
                print("입력이 잘못되었습니다. 다시 입력해주세요.")
            } else {
                studentInfo[studentName] = nil
            }
//        case "3":
//
//        case "4":
//
//        case "5":
//
//        case "X":
            
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            
        }
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    
}

