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
  Error: BOOLEAN;
  NameFile: TEXT;
PROCEDURE ReadName(VAR Fin, Fout: TEXT);
VAR
  Ch: CHAR;
BEGIN {ReadName}
  WRITELN('Enter the surname of student number ', Student + 1);
  REWRITE(Fout);
  IF NOT EOLN
  THEN
    WHILE (NOT EOLN(Fin)) AND (NOT Error)
    DO
      BEGIN
        IF NOT(EOLN)
        THEN
          READ(Fin, Ch);  
        IF (Ch <> ' ')   
        THEN
          IF (NOT(Ch < 'A')) OR ((Ch > 'z'))
          THEN
            WRITE(Fout, Ch)
          ELSE
            Error := TRUE  
      END
  ELSE
    Error := TRUE;    
  RESET(Fin)
END;{ReadName}
PROCEDURE WriteName(VAR Fin, Fout: TEXT);
VAR
  Ch: CHAR;
BEGIN {WriteName}
  RESET(Fin);
  WHILE NOT EOLN(Fin) AND (NOT Error)
  DO 
    BEGIN
      READ(Fin, Ch);
      WRITE(Fout, Ch)       
    END
END;{WriteName}  
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE (Student < ClassSize) AND (NOT Error)
  DO 
    BEGIN
      Error := FALSE;
      TotalScore := 0;
      WhichScore := 0;
      ReadName(INPUT, NameFile);
      IF (NOT Error)
      THEN 
        BEGIN
          WRITELN('Enter grades of the student''s number ', Student + 1);  
          WHILE (WhichScore < 4) AND (NOT Error) 
          DO
            BEGIN   
              IF (NOT EOLN)
              THEN
                READ(NextScore)
              ELSE
                IF (WhichScore <> 4)
                THEN
                  Error := TRUE;           
              IF (NextScore < 0) OR (NextScore > 100)  
              THEN
                Error := TRUE;  
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore +1
            END;           
          READLN
      END; 
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      WriteName(NameFile, OUTPUT);      
      IF Error = FALSE
      THEN    
        IF (Ave MOD 10) >= 5
        THEN
          WRITELN(' ', Ave DIV 10 + 1)
        ELSE
          WRITELN(' ', Ave DIV 10)
      ELSE
        WRITELN('Incorrect Data');      
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  IF NOT Error
  THEN
  BEGIN
    WRITELN;
    WRITELN ('Class average: ');
    ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
    WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10 : 1)
  END  
END.  {AverageScore}                     
