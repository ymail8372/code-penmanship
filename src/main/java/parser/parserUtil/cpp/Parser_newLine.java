package parser.parserUtil.cpp;

import java.util.ArrayList;

import util.Util;

public class Parser_newLine {

	public static String getResult(String code) {
		int total = 0;
		int endl = 0;
		int newLine = 0;
		String result = null;
		String[] lines = Util.splitCode(code);
		ArrayList<String> operator = new ArrayList<String>();
		
		operator.add("endl");
		operator.add("\n");

		for (int i = 0; i < lines.length; i ++) {
			for (int j = 0; j < operator.size(); j ++) {
				ArrayList<Integer> indexes = Util.findIndexes(operator.get(j), lines[i]);
				
				if (j == 0) {
					endl += indexes.size();
				}
				else {
					newLine += indexes.size();
				}
			}
		}
		
		total = endl + newLine;
		result = Integer.toString(total) + " " + Integer.toString(endl) + " " + Integer.toString(newLine);
		
		return result;
	}
}
