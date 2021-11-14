package parser;

import parser.parserUtil.*;
import util.Util;

public class Parser_c{
	
	public static String[] parse(String code) {
		String[] results = new String[2];
		
		results[0] = Parser_endSpace.getResult(code);
		results[1] = Parser_equalSign.getResult(code);
		
		return results;
	}
	
}
