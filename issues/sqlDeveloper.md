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
