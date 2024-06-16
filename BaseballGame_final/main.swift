
import Foundation


let baseballGame = BaseballGame()

var ischange: Bool = true

while ischange {
    print("환영합니다! 원하시는 번호를 입력해주세요.\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
    
    if let selectNum = readLine() {
        switch selectNum {
        case "1": 
            baseballGame.start()
        case "2":
            baseballGame.start()
        case "3":
            baseballGame.endGame()
            ischange = false
        default: print("올바른 숫자를 입력해주세요.")
        }
    }
}
