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
{� ������� ���� ������� ����������� � ��� ��� ��������� ���������� �� ������ � �� ��������.
��� ��� ���������� �� �������� ���������� ��������� �������: ������ ������ �������� ��������� � 
TotalScore ����� ���������� �� 10 � ���� ������� �� ������� TotalScore > 5 => ���� ��������� ������ � ������� ������� 
������� � ������������ �������, ���� < 5, �� ����������� � ������� ������� � ��������� �� �����
���������� �� ������ ������� ��� ������ ��������� ���������� �� 10 � ����� �� ���������� ��������� ���������� �� ���������� ������ � 1 ��������, 
� ��������� �� ����� ����� ����� ������� ������������� ����� �� 10 � ����� ������� ������� �� ���� �� �������} 

        
              
