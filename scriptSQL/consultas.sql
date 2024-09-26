select avg(Pais.qtdHabitantes), avg(Universidade.pontGeral) from Pais JOIN Universidade ON Pais.idPais = universidade.idUniversidade
where Pais.qtdHabitantes > 100;

select Pessoa.nomeCompleto, Pessoa.netWorth from Pessoa join Industria ON Pessoa.Industria_idIndustria = Industria.idIndustria
where Industria.transacao > 4000
order by Pessoa.netWorth desc;
