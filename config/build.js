//
// Sample:
// https://github.com/jrburke/r.js/blob/master/build/example.build.js
//

({
  appDir: "../",

  // Align with main.js so that require.config relative paths work.
  baseUrl: "public/javascripts",
  dir: "../build",

  // Load require.config paths defined in main.js
  mainConfigFile: '../public/javascripts/main.js',

  modules: [
    {
      name: "main"
    }
  ],

  fileExclusionRegExp: /(^\.)|(^config\/)|(^app\/)|(^script\/)|(^vendor\/bootstrap\/)/
})