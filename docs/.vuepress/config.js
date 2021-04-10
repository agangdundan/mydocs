module.exports = {
  theme:"antdocs",
  title: "VuePress-Creator",
  description: "A lightweight creator for VuePress project.",
  base: "/mydocs/",
  head: [
    ["link",{ rel: "icon",href: "/assets/logo.png" }]
  ],
  markdown: {
    lineNumbers: false,
  },
  themeConfig: {
    smoothScroll: true,
    nav: require("./config/nav"),
    sidebar: require("./config/sidebar"),
    lastUpdated: "Last Updated",
    repo: "https://github.com/agangdundan/mydocs",
    editLinks: false,
  },
};