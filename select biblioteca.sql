select * from tb_alunos;
select * from tb_emprestimos;
select * from tb_publicacoes;

select tb_alunos.alu_codigo, tb_alunos.alu_nome, tb_alunos.alu_numero, tb_alunos.alu_logradouro, tb_bairros.bai_bairro 
from tb_alunos inner join tb_bairros 
on tb_alunos.alu_codigo = tb_bairros.bai_codigo;
