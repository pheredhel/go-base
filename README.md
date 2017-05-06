[![build status](https://git.deep-water.de/pheredhel/go-base/badges/master/build.svg)](https://git.deep-water.de/pheredhel/go-base/commits/master)

## Base image for building go applications

- based on the official golang docker images
- includes metalinter and all liters supported by it.
- has docker installed, but needs a linked docker:dind to run this (doesn't run it's own docker demon, so it can run without privileges
- has git installed if go get is needed