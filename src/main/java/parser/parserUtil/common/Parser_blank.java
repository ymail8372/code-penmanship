package parser.parserUtil.common;

import util.Util;

public class Parser_blank {
	
	public static String getResult(String code) {
		int blankType = 0;
		int numOfspace = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		
		for (int i = 0; i < lines.length; i ++) {
			for (int j = 0; j < lines[i].length(); j ++) {
				if (lines[i].charAt(j) == '\t') {
					blankType = 1;
					break;
				}
				else if (lines[i].charAt(j) == ' ') {
					blankType = 0;
					numOfspace ++;
				}
				else {
					break;
				}
			}
			
			if (blankType == 1) {
				break;
			}
			else if (numOfspace != 0) {
				break;
			}
		}
		
		if (blankType == 0) {
			result = Integer.toString(blankType) + " " + Integer.toString(numOfspace);
		}
		else {
			result = Integer.toString(blankType);
		}
		
		return result;
	}
}
