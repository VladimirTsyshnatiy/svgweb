package org.svgweb.utils {
	/**
	 * @author v-dmbark
	 */
	public class StringUtils {

		/**
		* Determines whether the specified string begins with the specified prefix.
		*
		* @param s The string that the prefix will be checked against.
		*
		* @param key The prefix that will be tested against the string.
		*
		* @returns Boolean
		*
		* @langversion ActionScript 3.0
		* @playerversion Flash 9.0
		* @tiptext
		*/
		public static function beginsWith(s:String, key:String):Boolean {
			if (s == null) { return false; }
			return s.indexOf(key) == 0;
		}


		/**
		* Determines whether the specified string ends with the specified suffix.
		*
		* @param s The string that the suffic will be checked against.
		*
		* @param key The suffix that will be tested against the string.
		*
		* @returns Boolean
		*/
		public static function endsWith(s:String, key:String):Boolean {
			return s.lastIndexOf(key) == s.length - key.length;	
		}
		
		public static function getMatched(s:String, regex:RegExp):String {
			var a:Array = s.match(regex);
			if (a.length > 0) {
				return a[0];
			}
			return "";
		}

		public static function getMatchedSubMask(s:String, regex:RegExp, submaskId:int):String {
			var a:Array = s.match(regex);
			if (a && a.length > submaskId) {
				return a[submaskId];
			}
			return "";
		}
		
		public static function trim(s:String):String {
			return s.replace(/^\s*|\s*$/g, "");
		}
	}
}
