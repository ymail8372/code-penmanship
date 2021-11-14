package parser.parserUtil;

public class Parser_equalSign {

	public static String getResult(String code) {
		int total = 0;
		int blank = 0;
		int noblank = 0;
		String result = null;
		String[] lines = util.Util.splitCode(code);
		
		for (int i = 0; i < lines.length; i ++) {
			if (lines[i].contains("=") && !lines[i].contains("==")) {
				int indexOfEqualSign = lines[i].indexOf("=");
				
				if (lines[i].charAt(indexOfEqualSign-1) == ' ' && lines[i].charAt(indexOfEqualSign+1) == ' ' ) {
					blank ++;
				} else {
					noblank ++;
				}
			}
		}
		
		total = blank + noblank;
		result = Integer.toString(total) + " " + Integer.toString(blank) + " " + Integer.toString(noblank);
		
		return result;
	}
	
}
