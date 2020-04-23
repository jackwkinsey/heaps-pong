# Pong Clone in Heaps

A simple Pong clone made using the Heaps game engine.

## Setting Up

First install Haxe: [download here](https://haxe.org/download/)

Second install Heaps via `haxelib`, Haxe's package manager:

```bash
haxelib install heaps
```

Finally, install dependencies:

```bash
npm install
```

or

```bash
npm ci
```

to install using the `package-lock` file.

This will install `lite-server` to host the web build of the game locally on your machine.
With this installed, you can run `npm start` to spin up the server and navigate to `localhost:8080` to view the `index.html` file.

There is nothing here yet because the project hasn't been built.

Before we build the project, you'll want to install the [Haxe Extension Pack](https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-extension-pack) for VS Code.

## Building the Project

`.vscode/tasks.json` contains our build task. You can run this via the Terminal menu: `Terminal -> Run Build Task`.
This will use the `compile.hxml` file to build the project.

The output for the project will be placed in a `dist` directory. You should see `dist/game.js` and `dist/game.js.map`.

## Run the Project

You can now see the project in action. With the server still running, either navigate to `localhost:8080` or press F5 to debug the project.
