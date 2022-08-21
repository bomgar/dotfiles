#!/bin/bash
svn st | grep "^?" | cut -d " " -f8 | xargs svn add
