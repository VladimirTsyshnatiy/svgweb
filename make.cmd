cd src\org\svgweb
mxmlc -output ../../../build/src/svg.swf -define=BUILD::releaseName,'' -define=BUILD::releaseNumber,'1' -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=true -library-path+="../../../lib" -swf-version=15 -compiler.source-path ../../ -- SVGViewerWeb.as
cd ../../..

copy "build\src\svg.swf" "..\blocklyGrebnov\trunk\polyfills\svgweb\src"
copy "src\svg.js" "..\blocklyGrebnov\trunk\polyfills\svgweb\src"

copy "build\src\svg.swf" "..\testSVG\svgweb\src"
copy "src\svg.js" "..\testSVG\svgweb\src"