package parser;

import java.util.ArrayList;

import parser.parserUtil.cpp.*;

public class Parser_cpp {

	public ArrayList<String> parse(String code) {
		ArrayList<String> results = new ArrayList<String>();
		
		results.add(Parser_operator_shift.getResult(code));
		
		return results;
	}
}
