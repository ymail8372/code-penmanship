package parser.parserUtil.common;

import java.util.ArrayList;

import util.Util;

public class Parser_operator_logical {

	public static String getResult(String code) {
		int total = 0;
		int space = 0;
		int nospace = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		ArrayList<String> operator = new ArrayList<String>();
		
		operator.add("&&");
		operator.add("||");

		for (int i = 0; i < lines.length; i ++) {
			for (int j = 0; j < operator.size(); j ++) {
				
			if(lines[i].contains(operator.get(j))) {
				ArrayList<Integer> indexes = Util.findIndexes(operator.get(j), lines[i]);
				
					for (int k = 0; k < indexes.size(); k ++) {
						if (Util.check_String(lines[i], indexes.get(k))) {
							continue;
						}
						
						if (lines[i].charAt(indexes.get(k)) == lines[i].charAt(indexes.get(k) + 1) || lines[i].charAt(indexes.get(k)) == lines[i].charAt(indexes.get(k) - 1)) {
							if (lines[i].charAt(indexes.get(k) + 2) == ' ' && lines[i].charAt(indexes.get(k) - 1) == ' ') {
								space ++;
							}
							else {
								nospace ++;
							}
						}
					}
				}
			}
		}
		
		total = space + nospace;
		result = Integer.toString(total) + " " + Integer.toString(space) + " " + Integer.toString(nospace);
		
		return result;
	}
}
