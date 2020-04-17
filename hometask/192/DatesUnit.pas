UNIT DatesUnit;
{ Модуль описания дат  }
INTERFACE {              ИНТЕРФЕЙС           }
  TYPE
    Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                      Jul, Aug, Sep, Oct, Nov, Dec);{ объявление перечислимого типа mounth}
    DayNum = 1..31; {обьявление дней в месяце}
    Date   = RECORD {объявление записи date для описания даты (день.месяц)}
               Mo : Month;
               Day: DayNum
             END;  
    FileOfDate = FILE OF Date;
PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month); { Читает месяц }           
PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month); { Записывает Месяц }
PROCEDURE ReadDate(VAR FIn: TEXT; VAR Result: Date); { Читает дату }
PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date); { Записывает Дату }
PROCEDURE CopyOut(VAR DateFile: FileOfDate); { Записывает дату в OUTPUT } 
FUNCTION Less(VAR D1, D2: Date): BOOLEAN; { Возваращает true or false в зависмости от даты  }
IMPLEMENTATION {        ИМПЛЕМЕНТАЦИЯ         }   
PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN{ReadMonth}
  Mo := NoMonth;     
  IF NOT(EOLN(FIn))
  THEN
    READ(FIn, Ch1);   
  IF NOT(EOLN(FIn))
  THEN
    READ(FIn, Ch2);
  IF NOT(EOLN(FIn))
  THEN
    BEGIN
      READ(FIn, Ch3);     
      IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
      IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
      IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
      IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
      IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
      IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
      IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
      IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
      IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
      IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
      IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
      IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    END  
END;{ReadMonth} 
{=========}
PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE('JAN') ELSE
  IF Mo = Feb THEN WRITE('FEB') ELSE
  IF Mo = Mar THEN WRITE('MAR') ELSE
  IF Mo = Apr THEN WRITE('APR') ELSE
  IF Mo = May THEN WRITE('MAY') ELSE
  IF Mo = Jun THEN WRITE('JUN') ELSE
  IF Mo = Jul THEN WRITE('JUL') ELSE
  IF Mo = Aug THEN WRITE('AUG') ELSE
  IF Mo = Sep THEN WRITE('SEP') ELSE
  IF Mo = Oct THEN WRITE('OCT') ELSE
  IF Mo = Nov THEN WRITE('NOV') ELSE
  IF Mo = Dec THEN WRITE('DEC') ELSE 
  WRITE('NoMonth')
END; {WriteMonth}
{=========}
PROCEDURE ReadDate (VAR FIn: TEXT; VAR Result: Date);
BEGIN{ReadDate}
  ReadMonth(FIn, Result.Mo);
  READ(FIn, Result.Day)
END;{ReadDate}
{=========}
PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
BEGIN{WriteDate}
  WriteMonth(FOut, Result.Mo);
  WRITE(FOut, Result.Day : 3)
END;{WriteDate}
{=========}   
PROCEDURE CopyOut(VAR DateFile: FileOfDate);
VAR
  VarDate: Date;
BEGIN {CopyOut}
  WHILE NOT EOF(DateFile)
  DO
    BEGIN
      READ(DateFile, VarDate);
      WriteDate(OUTPUT, VarDate);
      WRITELN(OUTPUT)
    END
END;{CopyOut}
{=========}  
FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
{Less := D1 < D2}
BEGIN{Less}
  IF D1.Mo < D2.Mo
  THEN
    Less := TRUE
  ELSE
    IF D1.Mo > D2.Mo
    THEN
      Less := FALSE
    ELSE {D1.Mo = D2.Mo}
      Less := (D1.Day < D2.Day)
END{Less}  
END.  
