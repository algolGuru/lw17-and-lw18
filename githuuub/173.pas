Program Stat(INPUT, OUTPUT);
VAR
  Min, Max, Avg, NumCount, Sum, Num: INTEGER;  
  Error: BOOLEAN;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);{ReadDigit}
VAR
   Ch: CHAR;
BEGIN{ReadDigit}
  D := -1;{Если не встретится цирфа в файле, то процедура возвращает -1}
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
  IF Ch = '0' THEN D := 0;    
END;{ReadDigit}  
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);{ReadNumber}
VAR 
 I: INTEGER;
BEGIN{ReadNumber}
  N := 0;
  I := 0;
  WHILE NOT(EOLN(F)) AND (N >= 0) AND (I <> -1)
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
BEGIN
  Error := FALSE;
  Max := 0;
  Min := MAXINT;
  Sum := 0;
  Num := 0;
  NumCount := 0;
  Avg := 0;
  WRITELN('Inut your numbers ');
  WHILE (NOT EOLN(INPUT)) AND (NOT Error)
  DO
    BEGIN   
      ReadNumber(INPUT, Num);       
      IF (Num = -1) OR ((MAXINT - Num) < Sum)
      THEN
        Error := TRUE;
      NumCount := NumCount + 1;         
      IF (NOT Error)
      THEN
        BEGIN
          IF (Min > Num)
          THEN
            Min := Num;
          IF (Max < Num)
          THEN
            Max := Num;
          Sum := Sum + Num                                   
        END            
    END;   
  IF (NOT Error) AND (NumCount > 0)
  THEN
    BEGIN
      WRITELN('Average is: ', Sum DIV NumCount, '.', Sum MOD NumCount * 100 DIV NumCount);
      WRITELN('Min number is: ', Min);
      WRITELN('Max number is: ', Max)
    END
  ELSE
    WRITELN('Error')         
END.
  
