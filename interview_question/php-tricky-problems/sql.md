## How would you find duplicate email records in the users' table?
```
SELECT u1.first_name, u1.last_name, u1.email FROM users as u1
INNER JOIN (
SELECT email FROM users GROUP BY email HAVING count(id) > 1
) u2 ON u1.email = u2.email;```

https://www.fullstack.cafe/blog/mysql-interview-questions

https://youtu.be/_S4t9S5N4Ts?si=3iQvLtcVNmanFmxx

https://www.youtube.com/@PrabhNair1/playlists

https://www.youtube.com/watch?v=BkniGmOLQWw&ab_channel=PrabhNair

https://www.youtube.com/watch?v=iu60GUKPUes&list=PL0hT6hgexlYwEOk4HtUck4ydj24akizba&ab_channel=PrabhNair



GDP and GDPR in software 




Goal-Driven Software Development Process (GDP) is an iterative and incremental software development technique

GDPR stands for General Data Protection Regulation, a set of regulations in the European Union (EU) designed to protect the privacy and personal data of individuals.


https://aws.amazon.com/what-is/grc/


What is CASB ? is like mentionering the privacy & policy
What is CSPM ? not only monitoring also create policy

https://www.indeed.com/career-advice/interviewing/engineer-manager-interview-questions


what is a GRC
GRC SaaS provider


https://aws.amazon.com/what-is/grc/

https://aws.amazon.com/cdk/

https://www.diligent.com/en-gb/company/careers

https://www.linkedin.com/company/diligent-board-member-services/about/




HR promised me, organization provide me appersisal 2 time in the year and also promated me as senior position, but she resigned and I have discused with senior 
they told me somethig wrong with you, becuase we have also not getting the appersial last 3 years and I have disscused with manager they told due to lay off we have not layoff our team it is enough 
not thinking about appersial.



Interview question Proficiency in developing application using NodeJS 
Interview question 5-7 years of professional experience delivering secure applications in an agile environment. 
LAMP stack 
Laravel 
AWS services, CDK 
database design mysql
in CI/CD practise 
GIT, Docker
Secure Software Development Lifecycle 
PHP Unit test



stake holder / shareholder
Is your employee effect during recison .? like lots of company layoff there employees


https://www.youtube.com/watch?v=Rh4Wu4S8fBo&list=PL8TXyOjUKJwX0RuBTwTZlNJAwCB32yLXP&ab_channel=AshishMahawal



senior software engineer interview questions
problem solving skills

node js I have developed crud operation for event managemnt rest api
and one lambda function on aws using node js that feauture is to show all files and dir  that stored on aws EFS strogae system.