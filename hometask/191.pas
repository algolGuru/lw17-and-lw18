PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
VAR
  Sieve: SET OF  2 .. Max;
  X, Y: INTEGER;
BEGIN
  Sieve := [Min .. Max];
  X := Min;
  Y := Min;
  WRITELN('Started interval is: ');  
  WHILE X <> Max + 1
  DO
    BEGIN
      WRITE(X, ' ');
      X := X + 1
    END;
  X := Min; 
  WRITELN; 
  WHILE X <> Max + 1 
  DO
    BEGIN
      Y := X + 1;
      WHILE Y <> Max + 1
      DO 
        BEGIN
          IF Y MOD X = 0
          THEN
            Sieve := Sieve - [Y];
          Y := Y + 1               
        END;
      X := X + 1  
    END;
  WRITELN('Simple numbers in interval is: ');  
  X := Min;  
  WHILE X <> Max + 1
  DO
    BEGIN
      IF X IN Sieve
      THEN
        WRITE(X,' ');
      X := X + 1  
    END; 
END.          
