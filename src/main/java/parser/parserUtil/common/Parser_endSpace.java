package parser.parserUtil.common;

public class Parser_endSpace {
	
	public static String getResult(String code) {
		int result = 0;
		
		if (code.endsWith("}")) {
			result = 0;
		} else {
			result = 1;
		}
		
		return Integer.toString(result);
	}
	
}
