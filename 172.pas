PROGRAM ReadNumberApp(INPUT, OUTPUT);
VAR
 Over, Inv: BOOLEAN;
 Ch: CHAR;
 I, Num: INTEGER;
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
BEGIN
  D := 0;
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
  IF Ch = '0' THEN D := 0 
  ELSE
    BEGIN
      Ch := 'E'; //Значит считана не цифра 
    END    
END; 
BEGIN
  Inv := FALSE;
  Over := FALSE;
  WHILE NOT(EOLN(F)) AND (N >= 0)//Пока не конец строки 
  DO
    BEGIN
      ReadDigit(F, I);
      IF (Ch <> 'E')
      THEN
        BEGIN
          N := N*10 + I;
          IF (N > 32767)
          THEN
            BEGIN
              Over := TRUE;
              N := -1
            END  
        END
      ELSE  
        BEGIN
          Inv := TRUE;
          N := 0
        END      
    END
END;
BEGIN
  ReadNumber(INPUT, Num); 
  IF Inv = TRUE
  THEN
    WRITELN('Invalid data') 
  ELSE
    IF Over = TRUE                         
    THEN                                                  
      WRITELN('Overflow');
  WRITELN('Number is ', Num)   
END.      
