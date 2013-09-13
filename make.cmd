cd src\org\svgweb
mxmlc -output ../../../build/src/svg.swf -define=BUILD::releaseName,'' -define=BUILD::releaseNumber,'1' -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=false -compiler.source-path ../../ -- SVGViewerWeb.as
cd ../../..