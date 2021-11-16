package parser.parserUtil.common;

import util.Util;

public class Parser_ifelse {

	public static String getResult(String code) {
		int total = 0;
		int enter = 0;
		int noenter = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		
		for (int i = 0; i < lines.length; i ++) {
			if(lines[i].contains("else")) {
				int check = 0;
				int indexOfElse = lines[i].indexOf("else");
				
				for (int j = 0; j < indexOfElse; j ++) {
					if (lines[i].charAt(j) == '}') {
						noenter ++;
						check = 1;
						break;
					}
				}
				if (check == 0) {
					enter ++;
				}
			}
		}
		
		total = enter + noenter;
		result = Integer.toString(total) + " " + Integer.toString(enter) + " " + Integer.toString(noenter);
		
		return result;
	}
}
