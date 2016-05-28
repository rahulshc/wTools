@echo off
pushd %~dp0

  del /q .\doc\reference\*
  for /d %%x in (.\doc\reference\*) do @rd /s /q ^"%%x^"
  jsdoc --recurse --verbose --configure doc.json

popd