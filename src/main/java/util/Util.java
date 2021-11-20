package util;

import java.util.ArrayList;

public class Util {

	public static String[] splitCode(String code) {
		String[] lines = code.split("\n");
		
		return lines;
	}
	
	public static boolean check_String(String line, int index) {
		int quote_right = 0, quote_left = 0;
		boolean check = false;
		
		for (int i = index; i >= 0; i --) {
			if(line.charAt(i) == '"') {
				quote_left ++;
			}
		}
		
		for (int i = index; i < line.length(); i ++) {
			if(line.charAt(i) == '"') {
				quote_right ++;
			}
		}
		
		if (quote_left % 2 == 1 && quote_right % 2 == 1) {
			check = true;
		}
		
		return check;
	}
	
	public static ArrayList<Integer> findIndexes(String findword, String code) {
		ArrayList<Integer> indexes = new ArrayList<Integer>();
		int index = code.indexOf(findword);
		
		while (index != -1) {
			indexes.add(index);
			index = code.indexOf(findword, index + findword.length());
		}
		
		return indexes;
		
	}
	
}
