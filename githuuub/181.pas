PROGRAM AverageScore(INPUT, OUTPUT);{AverageScore}
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  MinScore = 0;
  MaxScore = 100;
TYPE
  Score = MinScore .. MaxScore;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Error: BOOLEAN;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  Error := FALSE;
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE (Student < ClassSize) AND (NOT Error)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 0;
      Error := FALSE;
      WRITELN('Enter the student''s grade number ', Student + 1);
      WHILE (WhichScore < NumberOfScores) AND (NOT Error)
      DO
        BEGIN   
          IF (NOT EOLN)
          THEN
            READ(NextScore)
          ELSE
            Error := TRUE;    
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore +1
        END;  
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF (Ave MOD 10) >= 5
      THEN
        WRITELN('Average rating of the student number ', Student + 1, ': ', Ave DIV 10 + 1)
      ELSE
        WRITELN('Average rating of the student number ', Student + 1, ': ', Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  IF (NOT Error)
  THEN
    BEGIN
      WRITELN('Class average: ');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10 : 1)
    END
  ELSE
    WRITELN('Invalid data')        
END.  {AverageScore}
{В задании было сказано разобраться в том как просходит округление по классу и по студенту.
Так вот округление по студенту происходит следующим образом: каждая оценка студента считается в 
TotalScore потом умнажается на 10 и если остаток от деление TotalScore > 5 => надо округлить оценку в большую сторону 
поэтому и прибавляется еденица, если < 5, то округляется в меньшую сторону и выводится на экран
Округление по классу считает все оценки студентов умноженных на 10 и делит на количество студентов умноженных на количество оценок у 1 студента, 
и выводится на экран целая часть деления получившегося числа на 10 и через запятую остаток от того же деления} 

        
              
