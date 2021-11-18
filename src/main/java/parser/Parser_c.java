package parser;

import java.util.ArrayList;
import parser.parserUtil.common.*;

public class Parser_c {
	
	public ArrayList<String> parse(String code) {
		ArrayList<String> results = new ArrayList<String>();
		
		results.add(Parser_assignment.getResult(code));
		results.add(Parser_equalSign.getResult(code));
		results.add(Parser_while.getResult(code));
		results.add(Parser_for.getResult(code));
		results.add(Parser_if.getResult(code));
		results.add(Parser_ifelse.getResult(code));
		results.add(Parser_blank.getResult(code));
		results.add(Parser_operator_four.getResult(code));
		results.add(Parser_operator_remainder.getResult(code));
		results.add(Parser_operator_comparison1.getResult(code));
		results.add(Parser_operator_logical.getResult(code));
		results.add(Parser_operator_increment.getResult(code));
		results.add(Parser_operator_comparison2.getResult(code));
		results.add(Parser_operator_equal.getResult(code));
		
		return results;
	}
	
}
