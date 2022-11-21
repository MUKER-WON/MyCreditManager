//
//  main.swift
//  MyCreditManager
//
//  Created by Muker on 2022/11/20.
//

import Foundation

//MARK: - Property

var studentReport = [Student]()

struct Student {
    var name: String
    var subject: [String:String]?
}

//MARK: - func

/// test
func testStudent() {
    for i in studentReport {
        print(i)
    }
    return menu()
}

/// error. 입력 오류
func error() {
    print("입력이 잘못되었습니다. 다시 확인해 주세요")
}

/// error. 빈 문자열 오류
func emptyError(str: String , again: () -> ()) {
    if str == "" {
        error()
        return menu()
    }
    //    if str.contains(" ") {
    //        error()
    //        return menu()
    //    }
}

/// 1. 학생추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let answer = readLine()!
    
    emptyError(str: answer, again: addStudent)
    
    for i in studentReport {
        if i.name == answer {
            print("\(answer)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return menu()
        }
    }
    studentReport.append(Student(name: answer))
    print("\(answer) 학생을 추가했습니다.")
    return menu()
}

/// 2. 학생삭제
func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let answer = readLine()!
    
    emptyError(str: answer, again: removeStudent)
    
    for (index, i) in studentReport.enumerated() {
        if i.name == answer {
            studentReport.remove(at: index)
            print("\(answer) 학생을 삭제하였습니다.")
            return menu()
        }
    }
    print("\(answer) 학생을 찾지 못했습니다.")
    return menu()
    
}

/// 3. 성적추가(수정)
func addGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력 예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    let answer = readLine()!
    
    emptyError(str: answer, again: removeStudent)
    
    let result = answer.split(separator: " ").map { String($0) }
    
    for (index, i) in studentReport.enumerated() {
        print(i)
        print(i.name)
        if i.name == result[0] {
            
            if i.subject == nil {
                studentReport[index].subject = [result[1]: result[2]]
                print("\(result[0]) 학생의 \(result[1]) 과목이 \(result[2])로 추가(변경)되었습니다.")
                return menu()
            } else {
                studentReport[index].subject![result[1]] = result[2]
                print("\(result[0]) 학생의 \(result[1]) 과목이 \(result[2])로 추가(변경)되었습니다.")
                return menu()
            }
        }
    }
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
    return menu()
}

/// 4. 성적삭제
func removeGrade() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift")
    let answer = readLine()!
    
    emptyError(str: answer, again: removeGrade)
    
    let result = answer.split(separator: " ").map { String($0) }
    // result[0]: 이름, result[1]: 과목명
    for (index, i) in studentReport.enumerated() {
        if i.name == result[0] {
            if studentReport[index].subject?[result[1]] != nil {
                studentReport[index].subject![result[1]] = nil
                print("\(result[0]) 학생의 \(result[1]) 과목의 성적이 삭제되었습니다.")
            } else {
                print("\(result[0])은(는) 찾을 수 없는 과목입니다.")
                return menu()
            }
        }
    }
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
    return menu()
}

/// 5. 성적조회
func readingGrade() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    let answer = readLine()!
    emptyError(str: answer, again: readingGrade)
    
    for (index, i) in studentReport.enumerated() {
        if i.name == answer {
            var score = 0.0
            for j in studentReport[index].subject!{
                
                print("\(j.key) : \(j.value)")
                
                switch j.value {
                case "A+":
                    score += 4.5
                case "A":
                    score += 4
                case "B+":
                    score += 3.5
                case "B":
                    score += 3
                case "C+":
                    score += 2.5
                case "C":
                    score += 2
                case "D+":
                    score += 1.5
                case "D":
                    score += 1
                default:
                    score += 0
                }
            }
            
            let numberFomatter = NumberFormatter()
            numberFomatter.roundingMode = .floor
            numberFomatter.maximumSignificantDigits = 3
            let real = numberFomatter.string(for: score)
            print("평점 :", real!)
            return menu()
        }
    }
    print("\(answer) 학생을 찾지 못했습니다.")
    return menu()
    
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
        return addStudent()
    case "2":
        return removeStudent()
    case "3":
        return addGrade()
    case "4":
        return removeGrade()
    case "5":
        return readingGrade()
    case "6":
        return testStudent()
    case "X", "x":
        return exit()
    default :
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        return menu()
    }
}

//MARK: - action

menu()



