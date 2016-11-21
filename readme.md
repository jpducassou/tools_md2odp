# Markdown to Opendocument presentation Docker image and wrapper

This projects is composed basically by a docker image and a script that runs
[odpdown](https://github.com/thorstenb/odpdown) inside it.

## Prerequites

Basically you only need docker and at least a presentation template file.

## Installing

just run the *build.sh* script to create the image and you may run
the *install.sh* script that basically links the md2odp from you ~/bin
directory.

## Running

Just run *md2odp* with the path to the markdown file and the name of the template.

```sh
md2odp /path/to/markdown.md my_template
```

## Authors

Jean Pierre Ducassou

## License

The code is covered by [WTFPL - Do What the Fuck You Want To Public License](http://sam.zoy.org/wtfpl).

