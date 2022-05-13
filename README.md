# SPSauce-GHAction
GitHub action simplifying running SPSacue build scripts in your workflow

## Usage
Allows you to run a SPSauce build script. Set up to take the same arg string as the wrapper
described in the [SPSauce repo](https://github.com/DosMike/SPSauce). See this example:

```yml
steps:
  - name: SPSauce Build
    uses: DosMike/SPSauce-GHAction@v1.0-alpha.3
    with:
      args: release.sauce --GITHUB_TOKEN ${{secrets.GITHUB_TOKEN}}
```

## Note

Currently the wrapper is not finding the SPSauce jar, I don't know how to fix that rn
or if a docker action is even the best route...
