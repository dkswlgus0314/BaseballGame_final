
import Foundation


class BaseballGame {
    func start() {
        
        let answer = makeAnswer()
        print("answer: \(answer)")
        
        
        while true {
               
            //사용자로부터 숫자 입력 받기
            print("< ⚾️ 게임을 시작합니다. 숫자를 입력하세요. >")
            
            let userInput = readLine()!  //string? 타입
            
            //**guard 문은 쉼표(,)를 사용해 여러 조건을 나열하면 조건이 순차적으로 평가**
            //1. 세자리가 아닌 경우
            //2. 특정 숫자 중복된 경우
            //3. 정수로 반환되지 않은 경우
            //4. 첫번재 자리 숫자 0 입력 시
            //=> 올바르지 않은 입력값입니다. -> 반복문 처음으로 이동
            
            guard userInput.count == 3 , Set(userInput).count == 3 , let input = Int(userInput) , userInput.first != "0" else {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            
            
            // 볼/스트라이크 힌트 구하기
            var strike = 0
            var ball = 0
            
            ball = Set(answer).intersection(Set(String(input))).count
            
            for i in 0...2 {
                if answer[i] == Array(String(input))[i] {
                    strike += 1
                }
            }
            
            ball -= strike
            
            //            while true {   -> while문 없어도 가능
            //같은 경우(스트라이크 3개) -> 정답입니다!
            //같은 자리에 같은 숫자 있는 경우 -> 스트라이크
            //다른 자리에 같은 숫자 있는 경우 -> 볼
            //전부다 틀린 경우 -> nothing
            if strike == 3 {
                print("[정답입니다!🎉]")
                break
            } else if strike == 0 && ball > 0 {
                print("\(ball) 볼")
            } else if strike > 0 && ball == 0 {
                print("\(strike) 스트라이크")
            } else if strike > 0 && ball > 0{
                print("\(strike) 스트라이크 \(ball) 볼")
            }
            else {
                print("[nothing...😢]")
            }
            //            }
            
        }
    }
    
    //정답 생성 함수 : 0에서부터 9까지 서로 다른 3자리 랜덤의 숫자
    func makeAnswer() -> [Character] {
        
        var answerNum: [Character] = []
        var conditon: Bool = true
        
        while conditon {
            answerNum = Array(String(Int.random(in: 100...999)))
            
            //첫번째 자리에 0이 오면 안됨 & 집합으로 중복된 숫자 검사
            if answerNum[0] != "0" && Set(answerNum).count == 3 {
                conditon = false
            }
        }
        return answerNum
    }
}


