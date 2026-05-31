--QUERIES--

1 — Quais cidades têm mais servidores offline: SELECT u.cidade, COUNT(*) AS quantidade_offline FROM users u WHERE status_servidor = 'offline' GROUP BY u.cidade ORDER BY quantidade_offline DESC;

2 — Média salarial por cargo: SELECT d.cargo, AVG(d.salario) AS media_salarial FROM detalhes d GROUP BY d.cargo ORDER BY media_salarial;

3 — Servidores offline vinculados a funcionários admitidos nos últimos 2 anos e com salário superior a 2000: SELECT u.nome, u.ip_servidor, d.cargo FROM users u INNER JOIN detalhes d ON d.cliente_id = u.id WHERE u.status_servidor = 'offline' AND d.data_admissao >= NOW() - INTERVAL '2 years' AND EXISTS(SELECT 1 FROM detalhes d WHERE d.cliente_id = u.id AND d.salario > 2000 );

4 — Top 5 maiores salários da empresa: SELECT u.nome, d.cargo, d.salario, u.cidade FROM users u INNER JOIN detalhes d ON d.cliente_id = u.id ORDER BY d.salario DESC LIMIT 5;

5 - Quantidade de funcionários por setor: SELECT d.setor, COUNT(*) AS quantidade_funcionarios FROM detalhes d GROUP BY d.setor ORDER BY quantidade_funcionarios DESC;

6 — Funcionários da rede 172 offline: SELECT u.nome, u.ip_servidor, d.cargo, u.cidade FROM users u INNER JOIN detalhes d ON d.cliente_id = u.id WHERE u.ip_servidor LIKE '172%' AND u.status_servidor = 'offline';

7 — Relatório de classificacao: SELECT u.nome, d.salario, u.carga_horaria, CASE WHEN d.salario > 8000 THEN 'ELITE' WHEN d.salario > 5000 THEN 'VIP' ELSE 'NORMAL' END AS classificacao FROM users u INNER JOIN detalhes d ON d.cliente_id =u.id ORDER BY u.nome ASC;
