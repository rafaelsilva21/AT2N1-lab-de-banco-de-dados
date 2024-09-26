select avg(distinct country.populaceMi), avg(distinct University.overallScore) from country JOIN university ON country.idCountry = university.Country_idCountry
where University.overallScore > 75;

select count(distinct country.idCountry)as c, count(distinct university.idUniversity)as u from country JOIN university ON country.idCountry = university.Country_idCountry
where University.overallScore > 75;

select count(distinct country.idCountry) as c, count(distinct university.idUniversity) as u from country JOIN university ON country.idCountry = university.Country_idCountry
where University.overallScore > 75 and university.teachingScore > 75;

select country.name, University.name from country JOIN university ON country.idCountry = university.Country_idCountry
where University.overallScore > 75  and university.teachingScore > 75;

select Person.fullName, Person.netWorthBi from Person join Industry ON person.Industry_idIndustry = Industry.idIndustry
where Industria.transacao > 4000
order by Pessoa.netWorth desc;

select * from country order by populaceMi desc;