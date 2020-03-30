PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE Student < ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 0;
      WRITELN('Enter the student''s grade number ', Student + 1);
      WHILE WhichScore < 4
      DO
        BEGIN   
          IF (NOT EOLN)
          THEN
            READ(NextScore); 
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore +1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF (Ave MOD 10) >= 5
      THEN
        WRITELN('Average rating of the student number ',Student + 1,': ', Ave DIV 10 + 1)
      ELSE
        WRITELN('Average rating of the student number ',Student + 1,': ', Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}

        
              
