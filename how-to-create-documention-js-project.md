# How to Generate Documentation for Your JavaScript Project

Documentation is an essential part of any software project. It helps others understand how to use your code and makes it easier to collaborate with other developers. In this guide, we'll show you how to generate documentation for your JavaScript project using JSDoc and GitHub Actions.

## What is JSDoc?

[JSDoc](https://jsdoc.app/) is a tool that generates documentation for JavaScript code. It uses comments in your code to create documentation that describes how to use your code. JSDoc is widely used in the JavaScript community and is compatible with many popular build tools and frameworks.

Creating documentation for your project is an essential part of software development. It helps other developers understand how your project works, how to use it, and how to contribute to it. In this guide, we will go through the steps to create documentation for your project using JSDoc, a popular documentation tool for JavaScript projects.

Step 1: Install JSDoc The first step to creating documentation for your project is to install JSDoc. You can do this using npm by running the following command in your project directory:
    
    npm install -g jsdoc 

Step 2: Add JSDoc comments to your code The next step is to add JSDoc comments to your code. JSDoc comments are special comments that start with /\*\* and contain information about your code. Here's an example:
    
```/** * Adds two numbers together. 
    * @param {number} x - The first number to add. 
    * @param {number} y - The second number to add. 
    * @returns {number} The sum of x and y. 
    */ 
    function add(x, y) 
    { 
      return x + y; 
    } 
```

In this example, we have a function called add that takes two parameters, x and y. We've added JSDoc comments to describe what the function does, what parameters it takes, and what it returns.

Step 3: Generate documentation using JSDoc Once you've added JSDoc comments to your code, you can use JSDoc to generate documentation. To do this, run the following command in your project directory:
    
    jsdoc <your-source-files> 

Replace `<your-source-files>` with a list of the files you want to generate documentation for. For example, if you want to generate documentation for all the files in your `src` directory, you can run:
    
    jsdoc src/ 

This will generate a `out` directory containing your documentation.

Step 4: Customize your documentation using templates JSDoc generates documentation using templates, which are sets of files that define the structure and style of your documentation. By default, JSDoc uses the `default` template, but you can customize this by creating your own template or using a pre-existing one.

There are many templates available for JSDoc, including DocStrap and BetterDocs. You can install these templates using npm and then specify them when you run JSDoc:
    
    jsdoc <your-source-files> -t <template-name> 

For example, to use the DocStrap template, you can run:
    
    jsdoc src/ -t docstrap 

Step 5: Deploy your documentation Once you've generated your documentation, you can deploy it to a website or hosting service so that others can access it. One way to do this is to use a build tool like Grunt, which can automate the process of generating and deploying your documentation.

Another option is to use a JSDoc GitHub Action, which can automatically generate and deploy your documentation whenever you push changes to your repository. You can use the `jsdoc-action` GitHub Action by adding the following YAML code to your `.github/workflows` directory:

``` 
name: Generate Documentation

on:

  push:

    branches:

      - main

jobs:

  build:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v2

      - uses: andstor/jsdoc-action@v1.1.1

        with:

          args: src/ -d docs

      - uses: peaceiris/actions-gh-pages@v3

        with:

          github_token: ${{ secrets.GITHUB_TOKEN }}

          publish_dir: ./docs

```

This code sets up a GitHub Action that will generate documentation whenever you push changes to the main branch of your repository. Here's what each part of the code does:

* `name`: This sets the name of the GitHub Action.
* `on`: This sets the event that will trigger the GitHub Action. In this case, the Action will run whenever you push changes to the main branch of your repository.
* `jobs`: This section defines the jobs that the GitHub Action will run.
* `build`: This sets the name of the job.
* `runs-on`: This sets the environment that the job will run in. In this case, the job will run on a Ubuntu machine.
* `steps`: This section defines the steps that the job will run.
* `uses`: This sets the Action that will be used for the step. In this case, we're using the `actions/checkout` Action to check out our code and the `andstor/jsdoc-action` Action to generate our documentation.
* `args`: This sets the arguments that will be passed to the `jsdoc` command. In this case, we're generating documentation for the `src` directory and outputting it to the `docs` directory.
* `with`: This sets additional options for the Action. In this case, we're setting the `github_token` option for the `peaceiris/actions-gh-pages` Action, which will deploy our documentation to the `gh-pages` branch of our repository.
* `secrets.GITHUB_TOKEN`: This is a GitHub secret that's used to authenticate the deployment of our documentation. You'll need to create this secret in your repository settings.

Note: Before using this code, you'll need to set up your GitHub Pages site to use the `gh-pages` branch as the source for your documentation. You can find more information on how to do this in the GitHub Pages documentation.


## More customization of your docs using edit JSDoc Configuration
To generate documentation with JSDoc, you'll need to create a configuration file. The configuration file tells JSDoc which files to document, which template to use, and other settings.

Here's an example configuration file:
```
{
    "source": {
        "include": ["src"],
        "exclude": ["src/test"]
    },
    "opts": {
        "template": "path/to/template",
        "destination": "docs/"
    }
}
```
Another example to more configuration :: 

```
{
  "tags": {
      "allowUnknownTags": true,
      "dictionaries": [
          "jsdoc",
          "closure"
      ]
  },
  "source": {
      "include": [
          "src/"
      ],
      "exclude": [
          "src/tests/"
      ]
  },
  "plugins": [
      "plugins/markdown"
  ],
  "opts": {
      "template": "node_modules/ink-docstrap/template",
      "destination": "docs/",
      "recurse": true,
      "verbose": true,
      "configure": "node_modules/ink-docstrap/template/jsdoc.conf.json",
      "meta": {
          "title": "My Project",
          "description": "Documentation for My Project"
      }
  },
  "templates": {
    "systemName": "My Project",
    "footer": "Copyright (c) My Company",
    "includeDate": true,
    "navType": "vertical",
    "theme": "cerulean",
    "linenums": true,
    "collapseSymbols": false,
    "inverseNav": false,
    "outputSourceFiles": true,
    "outputSourcePath": true,
    "dateFormat": "YYYY-MM-DD",
    "syntaxTheme": "default",
    "sort": "alphabetical",
    "search": true
  }
}
```

Reference Link :: 
- [Click to visit Official JSDoc documentation](https://jsdoc.app)
- [An API documentation generator for JavaScript](https://github.com/jsdoc/jsdoc)
- [Template 1 Docstrap](https://github.com/docstrap/templatesdocstrap)
- [Template 2 Better Docs](https://github.com/SoftwareBrothers/better-docs)
### Some other tool
- Build tools :: grunt
- jsdoc action to deploy docs : https://github.com/andstor/jsdoc-action
