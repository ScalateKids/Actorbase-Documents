#!/bin/node

var fs = require('fs');
var exec = require('child_process').exec;
var path = require('path');
var dirname = '/users/ambdere/actorbase/Actorbase-Documents/RP';

var walk = function(dirname) {
  fs.readdir(dirname, function(err, filenames) {
    if (err) {
      console.log("[!] Error" + err);
      return;
    }
    filenames.forEach(function(fileName) {
		console.log(fileName);
	  fs.stat(dirname + "/" + fileName, function(err, stat) {
        if (stat && stat.isDirectory()) {
          walk(dirname + "/" + fileName);
        } else {
          if(path.extname(dirname + "/" + fileName) == '.tex') {
            var cmd = 'pdflatex -output-directory=/users/ambdere/actorbase/Actorbase-Documents/build -halt-on-error -file-line-error ' + dirname + "/" + fileName;
            exec(cmd, function(err, stdout, stderr) {
              if (err) {
                console.log("[!] Error during tex compilation: " + err);
                // console.log(stdout);
                return;
              }
              exec(cmd, function(err, stdout, stderr) {
                if (err) {
                  console.log("[!] Error during tex compilation: " + err);
                  // console.log(stdout);
                  return;
                }
                console.log("..OK");
              });
            });
          }
        }
      });
    });
  });
}

walk(dirname);
