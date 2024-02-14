
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
