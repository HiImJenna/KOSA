import java.util.ArrayList;
import java.util.List;

//https://cafe.naver.com/kosait/329
	
/*	
자바 8가지 기본 타입(값타입) : JAVA API 제공

8가지 기본 타입에 대해서 객체 형태로 사용 가능 하도록 만든 클래스(wrapper class)
 [ 사용 ]
1. 매개변수 객체 요구될때
2. 기본형 값이 아닌 객체 형태로 저장이 필요시
3. 객체간 값 비교
4. 타입 변환시 처리 

>>generic 설계 (객체 형태) > int > Integer


*/
public class Ex08_Wrapper_Class {
	public static void main(String[] args) {
		int i =100;
		/*
		Integer n = new Integer(500);
		System.out.println("n :" + n); //500
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);
		*/
		//POINT
		//parameter 활용
		//제너릭(generic) : 객체 생성시 타입 강제 방식 >> wrapper class
		
		List<Integer> li = new ArrayList<Integer>();
		li.add(100);
		//li.add("A");
		for(int value : li) {
			System.out.println(value);
		}
		
		Integer i2 = new Integer(100);
		Integer i3 = new Integer(100);
		System.out.println(i2 == i3); //false // 주소값을 비교
		System.out.println(i2.equals(i3)); //true // 주소를 찿아가서 그 값을 비교
		
		//String  >> 문자열값 비교 >> equals (재정의)
		
		int i4 = 100;
		int i5 = 100;
		System.out.println(i4 == i5);
	}
	
	static void iMethod(Integer i) {
		
	}

}