PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE
  SetOfNumbers = SET OF Min .. Max;
VAR
  Sieve: SetOfNumbers;
  X, Y: INTEGER;
{========}  
PROCEDURE WriteSimpleNumbersSieve(VAR SieveWindow: INTEGER; VAR SieveOfNumbers: SetOfNumbers);
BEGIN {WriteSimpleNumbersSieve}
  WRITELN('Simple numbers in interval is: ');  
  SieveWindow := Min;  
  WHILE SieveWindow <> Max + 1 
  DO
    BEGIN
      IF SieveWindow IN SieveOfNumbers
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
PROCEDURE FindSimpleNumbers(VAR SieveWindowX, SieveWindowY: INTEGER; VAR SieveOfNumbers: SetOfNumbers);
BEGIN{FindSimpleNumbers}
WHILE SieveWindowX <= SQRT(Max) {Достаточно проходить лишь до корня от максимума, а не до Максимума }
  DO
    BEGIN
      SieveWindowY := SieveWindowX;
      WHILE SieveWindowY < Max + 1 
      DO 
        BEGIN
          IF (SieveWindowY MOD SieveWindowX = 0) AND (SieveWindowY <> SieveWindowX) 
          THEN
            SieveOfNumbers := SieveOfNumbers - [SieveWindowY]; 
            SieveWindowY := SieveWindowY + SieveWindowX {Шаг окна не 1, а число равное x, так как нам нужно искать те, что делятся на x}                    
        END;  
      SieveWindowX := SieveWindowX + 1  
    END;
END;{FindSimpleNumbers}       
BEGIN{Prime}
  Sieve := [Min .. Max];
  X := Min;
  Y := Min;
  WriteSieve(X); {Печать начального множества}
  FindSimpleNumbers(X, Y, Sieve); {Поиск простых чисел}
  WriteSimpleNumbersSieve(X, Sieve) {Вывод множества простых}
END.{Prime}          
