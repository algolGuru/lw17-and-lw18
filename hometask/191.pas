PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
VAR
  Sieve: SET OF  2 .. Max;
  X, Y, Temp: INTEGER;
BEGIN
  Sieve := [Min .. Max];
  X := Min;
  Y := Min;
  Temp := Min;
  WRITELN('Started interval is: ');  
  WHILE X <> Max + 1
  DO
    BEGIN
      WRITE(X, ' ');
      X := X + 1
    END;
  X := Min; 
  WRITELN; 
  WHILE X <= SQRT(Max)
  DO
    BEGIN
      Y := X;
      WHILE Y < Max + 1 
      DO 
        BEGIN
          IF (Y MOD X = 0) AND (Y <> X) 
          THEN
            Sieve := Sieve - [Y];
          WRITELN(Y);  
          Y := Y + X                     
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
