package common;

import java.util.ArrayList;
import java.util.List;

public class Image {

	public static String profile1 = "${ pageContext.request.contextPath }/resources/img/profile1.png";
	public static String image1 = "${ pageContext.request.contextPath }/resources/img/clean1.png";
	public static String image2 = "${ pageContext.request.contextPath }/resources/img/laptop.png";
	public static String image3 = "${ pageContext.request.contextPath }/resources/img/mic.png";
	public static String image4 = "${ pageContext.request.contextPath }/resources/img/office.png";
	public static String image5 = "${ pageContext.request.contextPath }/resources/img/.png";
	
	
	private static ArrayList<String> list = new ArrayList<String>();
	
	public static void main() {
		list.add(profile1);
		list.add(image1);
		list.add(image2);
		list.add(image3);
		list.add(image4);
		list.add(image4);
		
	}
	
	
	public static String image() {
		
		int i = (int)(Math.random() * list.size());
		System.out.println(list.get(i));
		return list.get(i);
	}
}
