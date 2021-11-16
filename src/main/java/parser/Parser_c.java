package parser;

import java.util.ArrayList;
import parser.parserUtil.common.*;

public class Parser_c{
	
	public ArrayList<String> parse(String code) {
		ArrayList<String> results = new ArrayList<String>();
		
		results.add(Parser_endSpace.getResult(code));
		results.add(Parser_equalSign.getResult(code));
		results.add(Parser_while.getResult(code));
		results.add(Parser_for.getResult(code));
		results.add(Parser_if.getResult(code));
		results.add(Parser_ifelse.getResult(code));
		
		return results;
	}
	
}
