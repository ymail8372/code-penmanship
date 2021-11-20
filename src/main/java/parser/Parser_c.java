package parser;

import java.util.ArrayList;

import parser.parserUtil.c.*;

public class Parser_c {
	private ArrayList<String> results = new ArrayList<String>();
	
	public ArrayList<String> parse(String code) {
		
		results.add(Parser_printf.getResult(code));
		results.add(Parser_scanf.getResult(code));
		
		return results;
	}
	
}
