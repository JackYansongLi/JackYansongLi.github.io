# ![site icon](./resources/blog-icon.png) notes
*Notes about TeXmacs*

This is an attempt to a blog/wiki about [TeXmacs](http://www.texmacs.org). It aims to be a container for articles, snippets, comments, developer docs, proposals, ... 

The site is served at https://texmacs.github.io/notes/ 

All the HTML code is automatically generated from the TeXmacs sources which are the primary source of content. Since TeXmacs itself takes care of the conversion there is essentially no need for an external software like `Jekyll` or `Hugo`.

The idea is that the site can be browsed both via a standard web browses on the Internet and via TeXmacs locally in the cloned repository. This setup allows an higher degree of interaction with the local copy. 

Contributions (also as pull requests) are welcome. 


Structure of the repository:

 * The `src/`directory hosts the TeXmacs sources for the website. 

 * The `docs/`directory hosts the HTML code for the website together with all the necessary resources which have to be served (fonts, css styles, etc...).

---

Setting:

  * Put the `note.ts` file into `.TeXmacs/styles`.
  * Edit `.tm` file in `src/`.
  * To automatically regenerate all the web pages  use `Tools->Web->Create/Update web site` within TeXmacs and choose `src/` as source and `docs/` as destination directories. 
  * Once the repository is pushed on github it becomes visible.




