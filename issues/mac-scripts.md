
- To update `modified date` for all the files/folder recursively under current folder 
  ```bash
  find . -exec touch -mt 202410101010 {} \;
  ```
