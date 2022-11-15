/*
Queries used for Tableau Project
*/

-- 1.
Create View Table1 as
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From projects.dbo.covid_deaths
where continent is not null;


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe
Create View Table2 as
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From projects.dbo.covid_deaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location;


-- 3.

Create View Table3 as
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From projects.dbo.covid_deaths
Group by Location, Population;


-- 4.

Create View Table4 as
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From projects.dbo.covid_deaths
Group by Location, Population, date;
