
public class Ex07_Operation {

	public static void main(String[] args) {
		// 대입연산자
		// +=, -=, *=, /=
		
		int sum = 0;
		sum += 1; // sum = sum + 1
		sum -= 1;
		System.out.println("sum : " + sum); //0
		
		///////////////////////////////////////////////////////////////////////////////////
		
//Q : 간단한 학점 계산기
//학점: A+, A-, B+, B-, ...F
//점수 : 94점
		
//판단기준 : 90점 이상인지 >> A부여
//판단기준 : 95점 이상인지 >> A+
//아니라면 >> A-
		
//판단기준 : 80점 이상인지 >> B부여
//판단기준 : 85점 이상인지 >> B+
//아니라면 >> B-
// Q: if문 사용해 학점 계산
		
int score = 89;
String grade = ""; //A+, A-를 담는 변수
System.out.println("당신의 점수는 :" + score);

//if문 동작

grade = score >= 95 ?  "A+" :
		score >= 90 ?  "A-" :
		score >= 85 ?  "B+" :
		score >= 80 ?  "B-" :
		score >= 75 ?  "C+" :
		score >= 70 ?  "C-" :
		"F";

		System.out.println("당신의 학점은 : " + grade);
	
/////////////////////////////////////////////////////////////////////////////////////////////////

//		[1번 문제]
//
//				​
//
//				알파벳(A~Z) 까지 출력하는 프로그램을 작성하세요
//
//				(for 문을 사용하세요)


	for (char i = 'a'; i <= 'z'; i++) {
		System.out.println(i);
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////
	
//	[2번 문제]
//
//			1~100까지 10행 10열로 출력하는 프로그램을 작성하세요
//
//			(for문을 사용하세요)
//
//			ex)
//
//			1 2 3 4 5 6 7 8 9 10
//
//			11 12 13 .....
//
//			91 92 93 94 ... 100

	int result = 0;
	for (int i = 1; i <= 10; i++) {
		for (int j = 1; j<= 10; j++) {
			System.out.print(++result + " ");
			}
			System.out.println();
		}
	
	
///////////////////////////////////////////////////////////////////////////////////

//	[3번 문제]
//
//			두개의 주사위를 던졌을 때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요 
	
	
	int random = 0;
		for (int i = 1; i <= 6; i++) {
			for (int j = 1; j <= 6; j++) {
				if(i + j == 6) {
					System.out.println(i + " & "+  j);
				}
			}
		}
	
	
	
	



		}
	}







