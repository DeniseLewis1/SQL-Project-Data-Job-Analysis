/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for data analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/*
Here's a breakdown of the results for top paying skills:
High Demand for Specific Tools and Technologies: SVN stands out as the highest paying skill with an average salary of $400,000. Other high-paying tools include Solidity ($179,000), Couchbase ($160,515), DataRobot ($155,486), and Golang ($155,000).
Emerging and Niche Technologies: Skills like Solidity (related to blockchain development), Golang (a programming language), and MXNet (a deep learning framework) are among the top-paying, indicating high demand for expertise in emerging and niche technologies. DataRobot (an AI and machine learning platform) and Hugging Face (a provider of natural language processing tools) also reflect the increasing importance of AI/ML skills.
Cloud and DevOps Skills: Terraform ($146,734), VMware ($147,500), and Ansible ($124,370) suggest that cloud and DevOps skills are highly valued. Skills related to CI/CD tools like GitLab ($134,126) and Puppet ($129,820) are also among the top earners.


[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]
*/