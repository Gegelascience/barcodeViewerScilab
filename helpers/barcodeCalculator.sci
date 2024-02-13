

setA = ["0001101", "0011001", "0010011", "0111101", "0100011", "0110001", "0101111", "0111011", "0110111", "0001011"]

setB = ["0100111", "0110011", "0011011", "0100001", "0011101", "0111001", "0000101", "0010001", "0001001", "0010111"]

setC = ["1110010", "1100110", "1101100", "1000010", "1011100", "1001110", "1010000", "1000100", "1001000", "1110100"]

function setToApply = findSetFromPrefix(prefix,index)
    if prefix == "0" || index == 1 then
        setToApply = "A"
    elseif prefix =="1" then
        if index == 2 || index == 4 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="2" then
        if index == 2 || index == 5 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="3" then
        if index == 2 || index == 6 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="4" then
        if index == 3 || index == 4 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="5" then
        if index == 4 || index == 5 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="6" then
        if index == 5 || index == 6 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="7" then
        if index == 3 || index == 5 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    elseif prefix =="8" then
        if index == 3 || index == 6 then
            setToApply = "A"
        else
            setToApply = "B"
        end
    else
        // prefix a 9
        if index == 4 || index == 6 then
            setToApply = "A"
        else
            setToApply = "B"
        end
        
    end
endfunction


function barcodeValue = calculateBarcode(eanData)
    possibleBarcode ="101"
    prefix = part(eanData,1)
    firstPartRaw = part(eanData,2:7)
    secondPartRaw = part(eanData,8:13)
    
    for i = 1:1:6
        setToApply = findSetFromPrefix(prefix,i)
        if setToApply == "A" then
            possibleBarcode = possibleBarcode + setA(strtod(part(firstPartRaw,i))+1)
        else
            possibleBarcode = possibleBarcode + setB(strtod(part(firstPartRaw,i))+1)
        end
    end
    
    possibleBarcode = possibleBarcode + "01010"
    
    for i = 1:1:6
        possibleBarcode = possibleBarcode + setC(strtod(part(secondPartRaw,i))+1)
    end
    
    barcodeValue = possibleBarcode + "101"
    
endfunction
