module.exports = {
  theme:"antdocs",
  title: "Gang の 文档",
  description: "记录和整理了一些工作内容.",
  base: "/mydocs/",
  head: [
    ["link",{ rel: "icon",href: "/assets/logo.png" }]
  ],
  markdown: {
    lineNumbers: false,
  },
  themeConfig: {
    logo: '/assets/logo.png',
    smoothScroll: true,
    backToTop: true,
    nav: require("./config/nav"),
    sidebar: require("./config/sidebar"),
    sidebarDepth: 1,
    lastUpdated: "上次更新",
    repo: "https://github.com/agangdundan/mydocs",
    editLinks: false,
  },
};