package parser.parserUtil.c;

import java.util.ArrayList;

import util.Util;

public class Parser_scanf {

	public static String getResult(String code) {
		int total = 0;
		int space = 0;
		int nospace = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		
		for (int i = 0; i < lines.length; i ++) {
//			if (Util.check_comment(lines[i])) {
//				break;
//			}
			if(lines[i].contains("scanf")) {
				ArrayList<Integer> indexes = Util.findIndexes("scanf", lines[i]);
				
				for (int j = 0; j < indexes.size(); j ++) {
				
					if (Util.check_String(lines[i], indexes.get(j))) {
						continue;
					}
				
					if (lines[i].charAt(indexes.get(j) + 5) == ' ') {
						space ++;
					}
					else {
						nospace ++;
					}
				}
			}
		}
		total = space + nospace;
		result = Integer.toString(total) + " " + Integer.toString(space) + " " + Integer.toString(nospace);
		
		return result;
	}
}
