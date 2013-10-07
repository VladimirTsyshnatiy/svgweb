package org.svgweb.utils {
	/**
	 * @author v-dmbark
	 */
	public class ObjectUtils {
		static public function mergeProperties(obj1:Object, obj2:Object):Object {
		    var result:Object = new Object();
			
		    for (var param1:String in obj2) {
				result[param1] = obj2[param1];
		    }
			
		    for (var param:String in obj1) {
		        result[param] = (obj2[param] ? obj2[param] : obj1[param]);
		    }
		    return result;			
		}
	}
}
