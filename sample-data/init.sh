#!/bin/sh

BASEDIR=$(dirname "$0")
$BASEDIR/bulk-create-employees-original.sh
$BASEDIR/bulk-create-employees-with-keyword.sh
$BASEDIR/bulk-create-employees-with-keyword-and-analyzer.sh