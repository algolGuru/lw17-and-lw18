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
  Ch: CHAR;
  Fale: BOOLEAN;
  F: TEXT;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE Student < ClassSize
  DO 
    BEGIN
      Fale := FALSE;
      TotalScore := 0;
      WhichScore := 0;
      WRITELN('Enter the surname of student number ', Student + 1);
      REWRITE(F);
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          READ(INPUT, Ch);
          IF Ch <> ' '    
          THEN
            WRITE(F, Ch)
        END;   
      RESET(INPUT);  
      WRITELN('Enter grades of the student''s number ', Student + 1);
      WHILE WhichScore < 4
      DO
        BEGIN   
          IF (NOT EOLN)
          THEN
            READ(NextScore);
          IF (NextScore < 0) OR (NextScore > 100)   
          THEN
            Fale := TRUE;  
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore +1;
        END;           
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(F);
      WHILE NOT EOLN(F)
      DO 
        BEGIN
          READ(F, Ch);
          IF ((Ch < 'A') OR (Ch > 'z')) AND (Ch <> ' ')
          THEN
            Fale := TRUE     
          ELSE
            WRITE(OUTPUT, Ch)       
        END; 
      IF Fale = FALSE
      THEN    
        IF (Ave MOD 10) >= 5
        THEN
          WRITELN(' ', Ave DIV 10 + 1)
        ELSE
          WRITELN(' ', Ave DIV 10)
      ELSE
        WRITELN('Incorrect Data');      
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}

        
              
