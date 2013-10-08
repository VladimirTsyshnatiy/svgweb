package org.svgweb.css {
	import flash.external.ExternalInterface;
	import org.svgweb.nodes.SVGSVGNode;
	import org.svgweb.utils.StringUtils;
	import org.svgweb.utils.ObjectUtils;
	import org.svgweb.core.SVGNode;
	/**
	 * @author v-dmbark
	 */
	public class CssProcessor {
		private static var instance:CssProcessor;
		
		public function CssProcessor():void {
			if( instance ) throw new Error("CssProcessor can only be accessed through CssProcessor.getInstance()");
		}
		
		
		public static function getInstance():CssProcessor {
			if (instance == null) {
				instance = new CssProcessor();
			}
			
			return instance;
		}
		
		public function ComputeStyleFor(node:SVGNode):Object {
			var classes:Array = getRelevantClasses(node);
			var result:Object;
			for each (var cssClass:CssClass in classes) {
				if (cssClass.hasOwnProperty("style")) {
					result = ObjectUtils.mergeProperties(result, cssClass["style"]);
				} 
			}
			
			return result; 			
		}
		
		private function getRelevantClasses(node:SVGNode):Array {
			var firstStepRules:Object;
			var result:Array = new Array();
            
			firstStepRules = node.svgRoot.getClassBy(node.getTagName(), node.getId(), node.getAttribute("class"));
			for each(var cssClass:CssClass in firstStepRules) {
				if (isClassRelevant(node, cssClass)) {
					result.push(cssClass);
				}
			}
			
			
			return result.sort(function (a:CssClass, b:CssClass):int {
				var aWeight:int = getSelectorSpecificity(a.selector);
				var bWeight:int = getSelectorSpecificity(b.selector);
				if (aWeight > bWeight) {
					return 1;
				}
				if (aWeight < bWeight) {
					return -1;
				}
				
				return 0; 
			});
		}
		
		private function getSelectorSpecificity(selector:String):int {
			// ID count
			var b:int = selector.match(/#([\w-]+)/ig).length;
			// class count
			var c:int = selector.match(/\.([\w-]+)/ig).length;
			// tag count
			var d:int = selector.match(/(\s|^)([\w]+)/ig).length;
			return b * 10000 + c * 100 + d * 1;
		}
		
		private function isClassRelevant(node:SVGNode, cssClass:CssClass):Boolean {
			if (!cssClass) {
				return false;
			}
			
			if (!cssClass.selector) {
				return false;
			}
			
			var tokens:Array = cssClass.selector.match(/([\w\#\.\-:]*)([\s\>\+]*)/ig);
			
			var currentNode:SVGNode = node;
			
			while (tokens.length > 0) {
				var token:String = tokens.pop();
				var singleSelector:String = StringUtils.getMatched(token, /[\w\#\.\-:]*/i);
				var operator:String = token.substring(singleSelector.length);
				
				if (operator == '') {
					if (!isSingleSelectorRelevant(currentNode, singleSelector)) {
						return false;
					}
				}

				if (operator.indexOf('>') >= 0) {
					if (currentNode.svgParent == null) {
						return false;
					}
					
					currentNode = currentNode.svgParent;
					if (!isSingleSelectorRelevant(currentNode, singleSelector)) {
						return false;
					}
				}
				
				if (operator == '+') {
					if (node.svgParent) {
						var sinblings:Array = node.svgParent.svgChildren;
						var i:int = 0;
						while (i < sinblings.length && sinblings[i] != node) {
							i++;
						}
						
						if (i == 0) {
							return false;
						}
						
						if (!isSingleSelectorRelevant(sinblings[i - 1], singleSelector)) {
							return false;
						}
					}
				}
				
				if (operator.indexOf(' ') >= 0) {
					var isRelevant:Boolean = isSingleSelectorRelevant(currentNode, singleSelector); 
					while ((currentNode != null) && !(currentNode is SVGSVGNode) && !isRelevant) {
						currentNode = currentNode.svgParent;
						if (currentNode != null) {
							isRelevant = isSingleSelectorRelevant(currentNode, singleSelector);
						}
					}
					
					if (!isRelevant) {
						return false;
					}
				}
			}
			
			return true;
		}
		
		public function isSingleSelectorRelevant(node:SVGNode, selector:String):Boolean {
			
			// Check identifier
			var selectorId:Array = selector.match(/#([\w-]*)/i);
			if (selectorId != null && selectorId.length > 1) {
				if (selectorId[1] != "" && node.getId() != selectorId[1]) {
					return false;
				}
			}

			// Check tag
			var selectorTag:Array = selector.match(/^([\w]*)/i);
			if (selectorTag != null && selectorTag.length > 1) {
				if (selectorTag[1] != "" && node.getTagName() != selectorTag[1]) {
					return false;
				}
			}
			
			// Is hover
			var hover:Array = selector.match(/:hover/i);
			if (hover != null && !node.isHover()) {
				return false;
			}
			
			// Check classes
			var elementClassesStr:String = node.getAttribute("class", null, false);
			var elementClasses:Array = elementClassesStr != null ? elementClassesStr.split(' ') : new Array();
			var selectorClasses:Array = selector.match(/\.([\w-]*)/ig);
			if (selectorClasses.length > 0) {
				for each(var cssClass:String in selectorClasses) {
					if (elementClasses.indexOf(cssClass.substring(1)) < 0) {
						return false;
					}
				}
			}

			return true;
		}
	}
}
