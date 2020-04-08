PROGRAM ReadNumberApp(INPUT, OUTPUT);{ReadNumberApp}
VAR
  Num: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);{ReadDigit}
VAR
   Ch: CHAR;
BEGIN{ReadDigit}
  D := -1;{Åñëè íå âñòðåòèòñÿ öèðôà â ôàéëå, òî ïðîöåäóðà âîçâðàùàåò -1}
  IF NOT(EOLN)
  THEN
    READ(F, Ch);  
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 ELSE
  IF Ch = '0' THEN D := 0 ELSE   
END;{ReadDigit}  
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);{ReadNumber}
VAR 
 I: INTEGER;
BEGIN{ReadNumber}
  N := 0;
  I := 0;
  WHILE NOT(EOLN(F)) AND (N >= 0) AND (I <> -1)//Добавил проверку на I <> -1, чтобы  число считывалось до первого нецифрового символа и предотвратил возможность нахождения в ней мусорного значения инициализировав её
  DO
    BEGIN        
      ReadDigit(F, I);
      IF (I <> -1)
      THEN
        BEGIN     
          IF (N <= MAXINT div 10) 
          THEN    
            BEGIN     
              N := N * 10;
              IF(MAXINT - N >= I)
              THEN
                N := N + I
              ELSE
                N := -1
            END                                            
          ELSE
            N := -1            
        END       
    END;
  READLN(F)  
END;{ReadNumber}
BEGIN{ReadNumberApp}
  ReadNumber(INPUT, Num); 
  IF Num <> -1
  THEN
    WRITELN('Number is ', Num)
  ELSE
    WRITELN('Overflow')
END.{ReadNumberApp}      
