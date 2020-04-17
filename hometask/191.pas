PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
VAR
  Sieve: SET OF  Min .. Max;
  X, Y: INTEGER;
{========}  
PROCEDURE WriteSimpleNumbersSieve(VAR SieveWindow: INTEGER);
BEGIN {WriteSimpleNumbersSieve}
  WRITELN('Simple numbers in interval is: ');  
  SieveWindow := Min;  
  WHILE SieveWindow <> Max + 1 
  DO
    BEGIN
      IF SieveWindow IN Sieve
      THEN
        WRITE(SieveWindow,' ');
      SieveWindow := SieveWindow + 1  
    END
END;{WriteSimpleNumbersSieve}
{========}
PROCEDURE WriteSieve(VAR SieveWindow: INTEGER);
BEGIN{WriteSieve}
  WRITELN('Started interval is: ');  
  WHILE SieveWindow <> Max + 1
  DO
    BEGIN
      WRITE(SieveWindow, ' ');
      SieveWindow := SieveWindow + 1
    END;
  SieveWindow := Min; 
  WRITELN 
END;{WriteSieve}
PROCEDURE FindSimpleNumbers(VAR SieveWindowX, SieveWindowY: INTEGER);
BEGIN{FindSimpleNumbers}
  WHILE SieveWindowX <= SQRT(Max)
  DO
    BEGIN
      SieveWindowY := SieveWindowX;
      WHILE SieveWindowY < Max + 1 
      DO 
        BEGIN
          IF (SieveWindowY MOD SieveWindowX = 0) AND (SieveWindowY <> SieveWindowX) 
          THEN
            Sieve := Sieve - [SieveWindowY]; 
          SieveWindowY := SieveWindowY + SieveWindowX                     
        END;  
      SieveWindowX := SieveWindowX + 1  
    END;
END;{FindSimpleNumbers}       
BEGIN{Prime}
  Sieve := [Min .. Max];
  X := Min;
  Y := Min;
  WriteSieve(X);
  FindSimpleNumbers(X, Y);
  WriteSimpleNumbersSieve(X)
END.{Prime}          
