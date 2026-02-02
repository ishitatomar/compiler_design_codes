//remove html tags
%{
#include <stdio.h>

extern FILE *yyin;
extern FILE *yyout;
%}

%%

"<"[^>]*">"      ;                      /* Ignore HTML tags */
[^<]+            fprintf(yyout, "%s", yytext);   /* Print text */

%%

int main()
{
    yyin  = fopen("input.txt", "r");    /* Input file */
    yyout = fopen("output.txt", "w");    /* Output file */

    if (!yyin || !yyout)
    {
        printf("File error\n");
        return 1;
    }

    yylex();      /* Start lexical analysis */

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap()
{
    return 1;
}
---input---
<!DOCTYPE html>
<html>
<head>
    <title>Student Profile</title>
</head>
<body>
    <h1><font color="maroon" >Ishita Tomar</font></h1>
    <img src="https://avatars.githubusercontent.com/u/142192420?v=4" alt="Student Image" align="right" height="150" width="150">
    <br><br><br><br><br>
    <h3><u>CGPA Details</u></h3>
    <p> Semester 1: 9.5<br>
        Semester 2: 9.6<br>
        Semester 3: 9.7<br>
        Semester 4: 8.9</p>
    <hr>
    <h3><u>Hobbies</u></h3>
    <p> Cooking<br>
        Gardening<br></p>
    <hr>
    <h3><u>Certifications</u></h3>
    <p> Python Programming<br>
        Web Development<br>
        Machine Learning Basics </p>
    <hr>
    <h3><u>Project Details</u></h3>
    <p> Hate Speech Detection System<br>
        Network and Port Scanner<br>
        Sentiment Analysis using Wrapper and Filter-Based Algorithms<br>
        Machine Learning-Based Phishing Attack Detection<br>
        Optimized Flight Path Finder for Domestic Routes<br>
        Custom Operating System Kernel Development<br>
        Oil Supply Chain Management with Predictive Analysis</p>
    <hr>
    <i><h4><marquee direction="left"> Computer Science and Engineering - Graphic Era University</marquee></h4></i>
    <hr>
    <p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZfLuviePOqQJ1yuhvxr80AsqV91Btr2rqZw&s" alt="github" height="20" width="20"> Visit my GitHub profile: <a href="https://github.com/ishitatomar">GitHub</a></p>
</body>
</html>

---output---



    Student Profile


    Ishita Tomar
    
    
    CGPA Details
     Semester 1: 9.5
        Semester 2: 9.6
        Semester 3: 9.7
        Semester 4: 8.9
    
    Hobbies
     Cooking
        Gardening
    
    Certifications
     Python Programming
        Web Development
        Machine Learning Basics 
    
    Project Details
     Hate Speech Detection System
        Network and Port Scanner
        Sentiment Analysis using Wrapper and Filter-Based Algorithms
        Machine Learning-Based Phishing Attack Detection
        Optimized Flight Path Finder for Domestic Routes
        Custom Operating System Kernel Development
        Oil Supply Chain Management with Predictive Analysis
    
     Computer Science and Engineering - Graphic Era University
    
     Visit my GitHub profile: GitHub



