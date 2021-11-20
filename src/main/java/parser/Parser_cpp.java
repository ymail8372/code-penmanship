package parser;

import java.util.ArrayList;

import parser.parserUtil.cpp.*;

public class Parser_cpp {
	private ArrayList<String> results = new ArrayList<String>();

	public ArrayList<String> parse(String code) {
		
		results.add(Parser_operator_shift.getResult(code));
		results.add(Parser_newLine.getResult(code));
		
		return results;
	}
}
