//
//  main.swift
//  MyCreditManager
//
//  Created by Muker on 2022/11/20.
//

import Foundation

//MARK: - Property

var studentList = [String]()

var studentReport = [[String]]()

struct Student {
    var name: String
    var subject: String
    var score: String
}


//MARK: - func

/// test
func testStudent() {
    print(studentList)
    print(studentReport)
    menu()
}

/// error. 입력 오류
func error() {
    print("입력이 잘못되었습니다. 다시 확인해 주세요")
}

/// error. 빈 문자열 오류
func emptyError(str: String , again: () -> ()) {
    if str == "" {
        error()
        menu()
    }
}

/// 1. 학생추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let answer = readLine()!
    
    emptyError(str: answer, again: addStudent)
    
    if studentList.contains(answer) {
        print("\(answer)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        menu()
    } else {
        studentList.append(answer)
        print("\(answer) 학생을 추가했습니다.")
        menu()
    }
}

/// 2. 학생삭제
func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let answer = readLine()!
    
    emptyError(str: answer, again: removeStudent)
    
    if studentList.contains(answer) {
        studentList.remove(at: studentList.firstIndex(of: answer)!)
        print("\(answer) 학생을 삭제하였습니다.")
        menu()
    } else {
        print("\(answer) 학생을 찾지 못했습니다.")
        menu()
    }
}

/// 3. 성적추가(수정)
func addGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력 예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    let answer = readLine()!
    
    emptyError(str: answer, again: removeStudent)
    
    if answer.contains(" ") == false {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        menu()
    } else {
        let result = answer.split(separator: " ").map { String($0) }
        if studentList.contains(result[0]) {
            studentReport += [result]
            print("\(result[0]) 학생의 \(result[1]) 과목이 \(result[2])로 추가(변경)되었습니다.")
            menu()
        } else {
            print("해당하는 학생을 찾을 수 없습니다.")
            menu()
        }
        
    }
}

/// 4. 성적삭제
func removeGrade() {
    print(#function)
    let answer = readLine()!
    
    emptyError(str: answer, again: removeGrade)
    
    if answer.contains(" ") == false {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        menu()
    } else {
        let result = answer.split(separator: " ").map { String($0) }
        if studentList.contains(result[0]) {
            for i in studentReport {
                if i.contains(result[0]) && i.contains(result[1]) {
                    
                }
            }
            menu()
        } else {
            print("해당하는 학생을 찾을 수 없습니다.")
            menu()
        }
    }

}

/// 5. 성적조회
func readingGrade() {
    print(#function)
    let answer = readLine()!
    
    emptyError(str: answer, again: readingGrade)

}

/// X. 종료
func exit() {
    print("프로그램을 종료합니다...")
}

/// 메인메뉴
func menu() {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    let answer = readLine()!
    
    switch answer {
    case "1":
        addStudent()
    case "2":
        removeStudent()
    case "3":
        addGrade()
    case "4":
        removeGrade()
    case "5":
        readingGrade()
    case "6":
        testStudent()
    case "X", "x":
        exit()
    default :
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        menu()
    }
}

//MARK: - action

menu()



