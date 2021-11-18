package parser.parserUtil.common;

import java.util.ArrayList;
import util.Util;

public class Parser_equalSign {

	public static String getResult(String code) {
		int total = 0;
		int blank = 0;
		int noblank = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		
		for (int i = 0; i < lines.length; i ++) {
//			if (Util.check_comment(lines[i])) {
//				break;
//			}
			if (lines[i].contains("=") && !lines[i].contains("==")) {
				ArrayList<Integer> indexes = Util.findIndexes("=", lines[i]);
				
				for(int j = 0; j < indexes.size(); j ++) {
					if (Util.check_String(lines[i], indexes.get(j))) {
						continue;
					}
				
					if (lines[i].charAt(indexes.get(j) - 1) == ' ' && lines[i].charAt(indexes.get(j) + 1) == ' ' ) {
						blank ++;
					}
					else {
						noblank ++;
					}
				}
			}
		}
		
		total = blank + noblank;
		result = Integer.toString(total) + " " + Integer.toString(blank) + " " + Integer.toString(noblank);
		
		return result;
	}
	
}
