package org.svgweb.css {
	import flash.external.ExternalInterface;
	import org.svgweb.utils.StringUtils;
	/**
	 * @author v-dmbark
	 */
	public class CssClass {
		public var selector:String;
		
		public var style:Object;
		
		public function CssClass():void { }
		
		public function fromString(str:String):void {
			if (str) {
				var selector:String = StringUtils.getMatchedSubMask(str, /\s*([\w\#\.\-\s,>+:\(\)\[\]]+?)\s*{.*?}/is, 1);
				if (!selector) {
					throw Error('Unable to parse css class. ' + str);
				}
				else {
					parseStyles(StringUtils.getMatchedSubMask(str, /{(.*?)}/is, 1));
					this.selector = selector;
				}
				
			}
		}
		
		public function parseStyles(str:String):void {
			if (str) {
				var properties:Array = str.split(';');
				var result:Object = new Object();
				for each(var property:String in properties) {
					var tokens:Array = property.split(':');
					if (tokens && tokens.length == 2) {
						result[StringUtils.trim(tokens[0])] = StringUtils.trim(tokens[1]);
					}
				}
				
				this.style = result;
			}
		}
	}
}
