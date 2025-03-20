Ref: https://gist.github.com/brokaw/95ade1358954cd97d0f2c8e992e14b08  

#### Making JSON Output More Readable with BBEdit

1. Close bbedit and Place `pretty-json.sh`, `compact-json.sh` files in `~/Library/Application\ Support/BBEdit/Text\ Filters`  

   ```shell
   # NOTE: jq is faster than python so skipping python based solution here
   mv ~/Desktop/pretty-json.sh ~/Library/Application\ Support/BBEdit/Text\ Filters
   mv ~/Desktop/compact-json.sh ~/Library/Application\ Support/BBEdit/Text\ Filters 
   ```

2. Restart bbedit.
3. If you face issue in above file
[refer](mac-configurations/python/fix-Errors.md)

- If you want to format entire file then go to option `Text` -> `Apply Text Filter` -> `pretty-json`
- If you want to format only portion of file, then select portion of texts and then select option `Text` -> `Apply Text Filter` -> `pretty-json`

#### `jq` summary:

##### pretty-json

```bash
echo '{"array":[1,2,3],"boolean":true,"color":"gold","null":null,"number":123,"object":{"a":"b","c":"d"},"string":"Hello World"}' | jq

# output
{
  "array": [
    1,
    2,
    3
  ],
  "boolean": true,
  "color": "gold",
  "null": null,
  "number": 123,
  "object": {
    "a": "b",
    "c": "d"
  },
  "string": "Hello World"
}
```

##### compact json
```bash
echo '{
  "array": [
    1,
    2,
    3
  ],
  "boolean": true,
  "color": "gold",
  "null": null,
  "number": 123,
  "object": {
    "a": "b",
    "c": "d"
  },
  "string": "Hello World"
}' | jq -c

# output
{"array":[1,2,3],"boolean":true,"color":"gold","null":null,"number":123,"object":{"a":"b","c":"d"},"string":"Hello World"}
```
