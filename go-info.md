Ref: https://godoc.org/

https://github.com/golang/go/wiki/Projects

#### Packages
```shell
# debugger
go get -u github.com/go-delve/delve/cmd/dlv

# oracle DB driver
go get -u gopkg.in/goracle.v2

# dependency management
go get -d -u github.com/golang/dep
[Site](https://golang.github.io/dep/docs/installation.html)

# tools
go get -u github.com/visualfc/gotools
go get -u github.com/visualfc/gocode

# required for eclipse https://github.com/GoClipse/goclipse
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/rogpeppe/godef

# go builder
go get -u github.com/constabulary/gb/
```


Eclipse Setup for golang

- After all package installation, go to eclipse market place, search and install [goclipse](https://github.com/GoClipse/goclipse)  
- Once it is installed, go to eclipse preferences -> search 'sdk' --> Set Go installation directory `/usr/local/Cellar/go/1.12.1/libexec`,  
- Search go in preferences --> Tools --> provide path for gocode, guru, godef `/Users/$USER/go-workspace/bin/gocode`  
- File -> new Go Project -> create new folder with name `main` under src folder.
- Add your entry point go file to main folder.
- That's it...
![image](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202019-04-06%20at%202.47.48%20AM.png)
