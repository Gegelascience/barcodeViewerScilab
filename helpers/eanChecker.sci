

function digit=calculateDigitCheck(eanDigitLess)
    lenCalcul = length(eanDigitLess)
    factorCalcul = 3
    somme = 0
    
    // limites incluses
    for j = lenCalcul:-1:1
        somme = somme + strtod(part(eanDigitLess,j)) * factorCalcul
        factorCalcul = 4- factorCalcul
    end
    
    digit = modulo(10- modulo(somme,10),10)
    
endfunction

function isEan = isCorrectEan(possibleEan)
    if length(possibleEan) == 13 then
        correctDigit = calculateDigitCheck(part(possibleEan,1:12))
        if correctDigit == strtod(part(possibleEan,13))then
            isEan = %T
        else
            isEan = %F
        end
    else
        isEan = %F
    end
    
endfunction

