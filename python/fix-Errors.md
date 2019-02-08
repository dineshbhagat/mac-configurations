1. If you get error as 
```python
'import sitecustomize' failed; use -v for traceback
```

```python
CTraceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/usr/local/Cellar/python@2/2.7.15_2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 287, in load
    return loads(fp.read(),
KeyboardInterrupt
```

Then edit following file remove python 3 related entries

~/Library/Python/2.7/lib/python/site-packages/homebrew.pth  
It might have following lines  
```python
import sys; sys.path.insert(1, "/usr/local/lib/python3.7/site-packages")
import sys; sys.path.insert(1, "/usr/local/lib/python3.7/site-packages")
```
remove it and if following lines are not present in file then add 
```python
import sys; sys.path.insert(1, "/usr/local/lib/python2.7/site-packages")
import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")
```

If you still facing issue [:disappointed:]
##### Last step
``` shell
brew uninstall --ignore-dependencies python python3 python@2  # Get rid of all homebrew pythons.
brew uninstall --force python  # Really.
rm -rf /usr/local/lib/python*  # Remove homebrew python libraries.
rm -rf ~/Library/Python/  # Remove any local complications homebrew may have thrown in.
brew install python python@2  # Install pythons.
```
##### Done here.  Optionally continue to prove to yourself that all is well:
```shell
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel
python -V   # Python 2.7.14
python3 -V  # Python 3.6.5
pip -V      # pip 10.0.1 from /usr/local/lib/python2.7/site-packages/pip (python 2.7)
pip3 -V     # pip 10.0.1 from /usr/local/lib/python3.6/site-packages/pip (python 3.6)
```

Ref: https://discourse.brew.sh/t/python-2-complains-import-sitecustomize-failed-use-v-for-traceback/1879/7

