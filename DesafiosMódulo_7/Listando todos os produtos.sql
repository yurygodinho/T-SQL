/*Desafio: listando todos os produtos*/
DECLARE @CODIGO VARCHAR(10)
DECLARE @NOME VARCHAR(50)
DECLARE @NUMERO_PRODUTOS INT
DECLARE @I INT

SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS]

SET @I = 1

WHILE @I <= @NUMERO_PRODUTOS
BEGIN
   SELECT @CODIGO = TP.[CODIGO DO PRODUTO], @NOME = TP.[NOME DO PRODUTO]
   FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * from [TABELA DE PRODUTOS]) TP
   WHERE TP.RowNum = @I;
   PRINT  @CODIGO + ' - ' + @NOME ;
   SET @I = @I + 1;
END;