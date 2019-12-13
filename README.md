# elsp


[![CircleCI](https://circleci.com/gh/yourgithubhandle/elsp/tree/master.svg?style=svg)](https://circleci.com/gh/yourgithubhandle/elsp/tree/master)


**Contains the following libraries and executables:**

```
elsp@0.0.0
│
├─test/
│   name:    TestElsp.exe
│   main:    TestElsp
│   require: elsp.lib
│
├─library/
│   library name: elsp.lib
│   namespace:    Elsp
│   require:
│
└─executable/
    name:    ElspApp.exe
    main:    ElspApp
    require: elsp.lib
```

## Developing:

```
npm install -g esy
git clone <this-repo>
esy install
esy build
```

## Running Binary:

After building the project, you can run the main binary that is produced.

```
esy x ElspApp.exe 
```

## Running Tests:

```
# Runs the "test" command in `package.json`.
esy test
```
