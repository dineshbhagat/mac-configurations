JavaFx error in start page:

Reason: Since Java-8 is default java version and set as $JAVA_HOME.
java-8 is adopt openjdk and does not have jfx.

If you change $JAVA_HOME to adopt openjdk 11 then this issue will not occure since it has jfx.

But as a workaround:

```bash
# installed version is 19.2.0, else go to proper version path
vim ~/.sqldeveloper/19.2.0/product.conf

# add following line at the end
SetJavaHome /Users/<user>/standalone/adoptopenjdk-11.jdk/Contents/Home
```

Ref: https://adoptopenjdk.net/migration.html

After upgrade to catalina, if you unable to open sqlDeveloper due to apple's security policy("“SQLDeveloper.app” can’t be opened because Apple cannot check it for malicious software.") and somehow this workaround(locate application from finder app --> Usually at `/Applications/SQLDeveloper.app` -> Right click on it and select open) too does not work then do as below  
add following alias to your `.bashrc/.zshrc` file.    

```bash
alias sqldeveloper="/Applications/SQLDeveloper.app/Contents/MacOS/sqldeveloper.sh; exit"
```
Now to open sqlDeveloper, execute `sqldeveloper` command in terminal. 

