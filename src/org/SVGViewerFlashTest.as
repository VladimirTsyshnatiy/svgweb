package org
{
    import org.svgweb.SVGViewerFlash;
    import flash.display.Sprite;

    [SWF(frameRate="40", width="800", height="600")]
    public class SVGViewerFlashTest extends Sprite
    {
        private var svgImage:SVGViewerFlash;

        public function SVGViewerFlashTest()
        {
            super();
            svgImage = new SVGViewerFlash();
            this.addChild(svgImage);
            svgImage.loadURL("test.svg");
        }

    }
}
