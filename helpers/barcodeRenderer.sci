
function  showInPlot(barcodeData)
    barcodeCols = []
    barcodeRects = []
    
    // 34 rect blanc 33 rect noir
    for index = 1:1:length(barcodeData)
        barcodeRects(1,index) = index*4
        barcodeRects(2,index) = 20
        barcodeRects(3,index) = 4
        barcodeRects(4,index) = 40
        if part(barcode,index) == "1" then
            barcodeCols(index) = 33;
        else
            barcodeCols(index) = 34;
        end
    end
    
    plot2d([-100,500],[-50,50],[-1,-1],"022")
    xrects(barcodeRects,barcodeCols)
endfunction

function writeInSVG(barcodeData,svgFilePath)
    doc = xmlDocument();
    svg = xmlElement(doc, "svg");
    
    xmlSetAttributes(svg, ["version" "1.1";"baseProfile" "full"; "width" "700";"heigth" "200"; "xmlns" "http://www.w3.org/2000/svg"]);
    
    g = xmlElement(doc, "g");
    xmlSetAttributes(g, ["stroke" "black"]);
    
    for index = 1:1:length(barcodeData)
        if part(barcode,index) == "1" then
            line = xmlElement(doc, "line");
            xmlSetAttributes(line, ["stroke-width" "4";"y1" "10"; "x1" string(index*4-4);"y2" "50"; "x2" string(index*4-4)]);
            xmlAppend(g,line);
        end
    end
        
    
    xmlAppend(svg,g);
    doc.root = svg;
    
    disp(svgFilePath);
    xmlWrite(doc, svgFilePath, %f);
endfunction
