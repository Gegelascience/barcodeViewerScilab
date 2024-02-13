

getd('./helpers')
// good exemple 3666154117284
possibleEan = "3666154117284"
disp(possibleEan);

if isCorrectEan(possibleEan) == %T then
    barcode = calculateBarcode(possibleEan)
    
end
