#!/bin/bash

echo "Parent Directory: "
read dir

npx create-snowpack-app $dir --template @snowpack/app-template-minimal

cd $dir

# dependencies
npm i react react-dom

# dev-dependencies
npm install --save-dev @snowpack/plugin-postcss postcss autoprefixer @snowpack/plugin-sass


# project structure
rm index.js index.html index.css

mkdir src
mkdir public

mkdir public/css
touch public/css/style.scss

mkdir src/components
mkdir src/assets


# config files

rm snowpack.config.mjs

# snowpack config files

echo "/** @type {import(\"snowpack\").SnowpackUserConfig } */
export default {
	mount: {
		// directory name: 'build directory'
		public: '/',
		src: '/dist',
	},
	plugins: ['@snowpack/plugin-postcss', '@snowpack/plugin-sass'],
	routes: [
		/* Enable an SPA Fallback in development: */
		// {\"match\": \"routes\", \"src\": \".*\", \"dest\": \"/index.html\"},
	],
	optimize: {
		/* Example: Bundle your final build: */
		// \"bundle\": true,
	},
	packageOptions: {
		/* ... */
	},
	devOptions: {
		/* ... */
	},
	buildOptions: {
		/* ... */
	},
};
" > snowpack.config.mjs

# postcss config files

touch "const cssnano = require('cssnano');
const postcssPresetEnv = require('postcss-preset-env');

module.exports = {
  plugins: [cssnano(), postcssPresetEnv(), require('autoprefixer')],
};" > postcss.config.js

# .gitignore

touch ".snowpack
/build
/node_modules" > .gitignore


# populating files

echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
	<meta charset=\"UTF-8\">
	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
	<title>Document</title>
	<script type=\"module\" src=\"/dist/index.js\"></script>
</head>
<body>
	<div id=\"root\"></div>
</body>
</html>" > public/index.html


# index.jsx file

echo "import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.jsx';

import '../public/css/style.scss';

ReactDOM.render(<App />, document.querySelector('#root));" > src/index.jsx

# App.jsx

echo "import React from 'react';
import ReactDOM from 'react-dom';

const App = () = {
    
};

export default App;
" > src/components/App.jsx
