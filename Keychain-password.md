<a href="{{ '/' | relative_url }}#keychain-password">:arrow_left:</a>

  #### Using the OS X Keychain to store and retrieve passwords

  ##### Adding secrete to toolchain

  - By using GUI ("Keychain-Access")

    1. Select File->New Password Item (cmd+N)
    2. Make sure Keychain item name is distinct —> `service-name` in command line
    3. Account name —> `USER` in command line, it is `$whoami`, or `echo ${USER}`  

  - Command line using security command

    - Help:
      ```bash
      security add-generic-password -h
      ```
    
    - Add command:   
      add-generic-password 
      
      ```bash
      $ security add-generic-password -a ${USER} -s <service-name> -w 
      ```

      Enter password on prompt, 

    - *Update* password if already exists : `-U ` flag

      ```bash
      $ security add-generic-password -a ${USER} -s <service-name> -w -U
      ```

    - Delete password: `security delete-generic-password -h`

      ```bash
      $ security delete-generic-password -a ${USER} -s <service-name>
      ```

    - Retrieve Password:  
      ```bash
      $ security find-generic-password -h
      ```

    - Retrieve Password in bash script or commandline:
      ```bash
      $ security find-generic-password -a ${USER} -s <service-name> -w
       OR
      $ security find-generic-password -l <service-name> -g 2>&1 | grep '^password' | sed -e 's/^password: "//' -e 's/"$//'
      ```

      
    [Ref](https://www.netmeister.org/blog/keychain-passwords.html)
