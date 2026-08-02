SELECT fb_employees1.id AS employee_1,
       fb_employees2.id AS employee_2
FROM facebook_employees fb_employees1
         INNER JOIN facebook_employees fb_employees2
                    ON fb_employees2.location = fb_employees1.location
                        AND fb_employees2.age != fb_employees1.age
                        AND fb_employees2.gender = fb_employees1.gender
                        AND fb_employees2.is_senior != fb_employees1.is_senior
                        AND fb_employees2.id < fb_employees1.id;
