package parser;

import java.util.ArrayList;

import parser.parserUtil.c.*;
import parser.parserUtil.common.*;

public class Parser_c {
	
	public ArrayList<String> parse(String code) {
		ArrayList<String> results = new ArrayList<String>();
		
		results.add(Parser_assignment.getResult(code)); // 0
		results.add(Parser_equalSign.getResult(code)); // 1
		results.add(Parser_while.getResult(code)); // 2
		results.add(Parser_for.getResult(code)); // 3
		results.add(Parser_if.getResult(code)); // 4
		results.add(Parser_ifelse.getResult(code)); // 5
		results.add(Parser_blank.getResult(code)); // 6
		results.add(Parser_operator_four.getResult(code)); // 7
		results.add(Parser_operator_remainder.getResult(code)); // 8
		results.add(Parser_operator_comparison1.getResult(code)); // 9
		results.add(Parser_operator_comparison2.getResult(code)); // 10
		results.add(Parser_operator_logical.getResult(code)); // 11
		results.add(Parser_operator_increment.getResult(code)); // 12
		results.add(Parser_operator_equal.getResult(code)); // 13
		
		results.add(Parser_printf.getResult(code)); // 14
		results.add(Parser_scanf.getResult(code)); // 15
		
		return results;
	}
	
}
