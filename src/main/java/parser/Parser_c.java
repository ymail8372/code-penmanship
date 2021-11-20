package parser;

import java.util.ArrayList;

import parser.parserUtil.c.*;

public class Parser_c {
	
	public ArrayList<String> parse(String code) {
		ArrayList<String> results = new ArrayList<String>();
		
		results.add(Parser_printf.getResult(code));
		results.add(Parser_scanf.getResult(code));
		
		return results;
	}
	
}
