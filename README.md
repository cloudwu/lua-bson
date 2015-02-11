## Introduction

This is a simple BSON library for Lua. 

## Building

```
make win
```
or
```
make linux
```

## Types

<table>
<th>Lua Type</th><th>BSON Type</th><th>Notes</th>
<tbody>
<tr><td>bson.null</td><td>Null</td><td></td></tr>
<tr><td>boolean</td><td>Boolean</td><td></td></tr>
<tr><td>number</td><td>Double</td><td></td></tr>
<tr><td>number</td><td>32-bit integer</td><td></td></tr>
<tr><td>number</td><td>64-bit integer</td><td>precision lost in lua 5.1/5.2</td></tr>
<tr><td>string</td><td>String</td><td></td></tr>
<tr><td>table</td><td>BSON Document</td><td></td></tr>
<tr><td>table</td><td>BSON Array</td><td>Lua table must be a sequence. (Continuous number key base 1)</td></tr>
<tr><td>bson.date(os.time())</td><td>UTC Datetime</td><td>milliseconds since epoch</td></tr>
<tr><td>bson.timestamp(os.time())</td><td>Timestamp</td><td>special mongodb type, two 32-bit number</td></tr>
<tr><td>bson.regex(regex,option)</td><td>Regular Expression</td><td></td></tr>	
<tr><td>bson.objectid()</td><td>ObjectID</td><td><a href="http://www.mongodb.org/display/DOCS/Object+IDs">MongoDB document ID</a></td></tr>
<tr><td>bson.minkey</td><td>Min Key</td><td></td></tr>
<tr><td>bson.maxkey</td><td>Max Key</td><td></td></tr>
<tbody>
</table>

## Replace field

These bson types (fixed length) below can be replace by new value after encode to bson object.

* int32
* int64
* double
* boolean
* date
* timestamp
* objectid

You need call makeindex() before replace.

## Getting started

See test.lua
