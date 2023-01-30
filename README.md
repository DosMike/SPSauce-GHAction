# SPSauce-GHAction
GitHub action simplifying running SPSacue build scripts in your workflow

## Usage
Allows you to run a SPSauce build script. Set up to take the same arg string as the wrapper
described in the [SPSauce repo](https://github.com/DosMike/SPSauce). See this example:

*.github\workflows\github-release-build.yml*
```yml
name: Plugin Release Archive
on:
  release:
    types: [published]
jobs:
  pack-plugin:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: SPSauce
        uses: DosMike/SPSauce-GHAction@1.0
        with:
          script: '<build file>'
          github-token: ${{ github.token }}
          args: '<additional args to SPS>'
```

*git.sauce*
```spsauce
sourcemod 1.11

auth github ${GITHUB_TOKEN}

spcomp -O2 myplugin.sp

with files
 myplugin.games.txt
 myplugin.smx
:release github ${GITHUB_REPOSITORY} ${GITHUB_REF_NAME}
```

## Notes

* You need the checkout step to get your repository into the action docker container.   
You could clone it by hand, but the actions is making it a lot easier.
* The build script is optional and relative to your repo root. It will use `git.sauce` by default.
* Just copy-paste the github-token line if you don't know what this does.
* For additional arguments to SPS, please check the SPSauce repo. This argument is optional.
