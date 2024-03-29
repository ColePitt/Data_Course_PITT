---
  output:
  pdf_document: default
html_document: default
---
  ## Exercise 1
  
  If:
  ```{r}
seq(1,10,by=2)
```
**Then what will be the value of:**
  ```{r, eval=FALSE, include=TRUE}
seq(1,10,by=3)
```


## Exercise 2

**Use the seq() function to generate the sequence  9, 18, 27, 36, 45.**
  
  
  ## Exercise 3
  
  If:
  ```{r}
seq(1,10,length.out = 5)
```
**Then what will be the value of:**
  ```{r, include=TRUE,eval=FALSE}
seq(1,10, length.out = 3)
```


## Exercise 4

If:
  ```{r}
x = 1:5
rep(x,2)
```
...And:
  ```{r}
rep(x,2, each=2)
```


**What will be the value of:**
  ```{r, include=TRUE, eval=FALSE}
rep(x,each=4)
```

## Exercise 5

If:
  ```{r}
x = "Hip"
y = "Hooray"
```
**Then what is the value of:**
  ```{r, include=TRUE,eval=FALSE}
rep(c(rep(x,2),y),3)
```
## Exercise 6
**Create a sequence with values (in this order):**
  100 95 90 85 80 75 70 65 60 55 50


## Exercise 7
If:
  ```{r}
Semester_Start = as.Date("2019-08-19")
Semester_End = as.Date("2019-12-05")
seq(Semester_Start,Semester_End,by="week")
```

**Then what would be the value of "midterm" when:**
  ```{r, include=TRUE,eval=FALSE}
midterm = seq(Semester_Start,Semester_End,length.out = 3)[2]
```
