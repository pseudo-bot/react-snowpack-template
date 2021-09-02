#!/bin/bash

echo "Parent Directory: "
read dir  

mkdir $dir
cd $dir

npm init -y

mkdir src public
mkdir src/components
mkdir src/assets

# installing npm packages

npm i react react-dom

## dev dependencies
npm i -D webpack webpack-cli webpack-dev-server 
npm i -D @babel/core @babel/preset-env @babel/preset-react node-sass

## loaders
npm i -D babel-loader sass-loader css-loader style-loader file-loader

## plugins
npm i -D html-webpack-plugin

# populating config files

## webpack.config.js
echo "const path = require('path');
const webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/index.jsx',
  output: {
    path:path.resolve(__dirname, \"dist\"),
  },
  devServer: {
    hot: true,
    open: true,
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: \"babel-loader\",
        }
      },
      {
        test: /\.(scss|css)$/,
        use: [\"style-loader\", \"css-loader\", \"sass-loader\"],
      },
      {
        test: /\.(png|jp(e*)g|svg|gif)$/,
        use: ['file-loader'],
      },
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, \"public\", \"index.html\"),
    }),
  ],
}
" > webpack.config.js

## .babelrc
   
echo "{
  \"presets\": [\"@babel/preset-env\", \"@babel/preset-react\"]
}
" > .babelrc

# populating files

## index.html

echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
	<meta charset=\"UTF-8\">
	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
	<title>$dir</title>
</head>
<body>
	<div id=\"root\"></div>
</body>
</html>" > public/index.html


# style.scss

echo "html {
	font-size: 10px;
}

*, *::after, *::before {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}" > src/index.scss


# index.jsx file

echo "import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.jsx';

import 'index.scss';

ReactDOM.render(<App />, document.querySelector('#root'));" > src/index.jsx

# App.jsx

echo "import React from 'react';

const App = () => {
    return(
      <div></div>
    )
};

export default App;
" > src/components/App.jsx