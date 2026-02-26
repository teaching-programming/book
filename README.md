# Teaching Programming Across Disciplines - Guidance for chapter authors

[Video instructions are available](https://media.ed.ac.uk/media//1_7nk68kt4) for chapter authors on how to submit your reviewed chapter to the GitHub repository. The PDF slides can be downloaded from the video attachments. The main steps are also summarised below.

**If you need assistance with any/all part(s) of the process, please email Charlotte ([`charlotte.desvages@ed.ac.uk`](mailto:charlotte.desvages@ed.ac.uk)) and Pawel ([`Pawel.Orzechowski@ed.ac.uk`](mailto:Pawel.Orzechowski@ed.ac.uk))**, and CC the editing team inbox ([`pairprogramming@ed.ac.uk`](mailto:pairprogramming@ed.ac.uk)).


## Finalise your chapter

Before getting ready to publish, finalise all your edits and format your chapter following the [Book Submission Guidelines](https://docs.google.com/document/d/1Yui8fuxUEiMsIX2G-oKfUs3vObPXb2VzKi2CKvzAg3o/edit?tab=t.0), and incorporating feedback from reviewers. See the [example chapter](https://teaching-programming.github.io/book/C36_pair-programming-across-disciplines.html) for reference.


## Convert your chapter to Markdown

If you didn't write your chapter as a [Markdown file](https://www.markdownguide.org/basic-syntax/), you will first need to export or convert it to Markdown. You will obtain a Markdown file with the `.md` extension (we'll call it `mychapter.md` here). Markdown files can be edited in any plain text editor (e.g. Notepad, vim...), without the need for any particular software.

- If you use Google Docs, you can directly export Markdown by clicking on File > Download, then selecting Markdown.
- If you use other software, e.g. MS Word or LaTeX, you can try using [pandoc](https://pandoc.org/demos.html).
- [Do ask for help](mailto:pairprogramming@ed.ac.uk) if you're not sure where to start!

Once you have a Markdown version, here are the final tweaks needed to match the format of the book. You can also look inside the [chapter template](00-chapter-template.qmd), which acts as a cheat-sheet showing short snippets of all those things in action.

### Format your images

In the Markdown file, your images will look like this:

`![Your image caption](/path/to/yourimagefile.png)`

Change it to the following (note the change to the image file path):

`![Your image caption](/chapters/images/Cxx_yourimagefile.png "Title, which will be displayed on mouse hover"){fig-alt="Some alt text which describes the image for screen reader users"}`

Don't forget to also rename your image files to add `Cxx_` at the start of the file name, corresponding to your chapter ID.

**If your chapter includes animated images e.g. in .gif format, you will need to provide print-friendly alternatives**. To do that, include both print and non-print versions, surrounded by ::: separator including `content-visible` accompanied by either `unless-format="html"` (for print) or `when-format="html"` (for website). There is a working example in the [chapter 23 in the section about 'relentless feeback'](https://github.com/teaching-programming/book/blob/main/C23_pair-programming-fusion.qmd) which [when rendered will look like this in the websote](https://teaching-programming.github.io/book/C23_pair-programming-fusion.html#relentless-feedback).

### Format your references

In the book, reference data is contained in a separate `.bib` file containing one entry for each cited work. The [chapter template](00-chapter-template.qmd) shows an example citation `@williams2010pair`, which creates an in-text tag, and automatically inserts a formatted citation at the end of the text, in the "References" section, by pulling the data from the entry in [`references.bib`](references.bib) corresponding to the `williams2010pair` tag (in this case, it's the first one in the file). You can see the result [on the website](https://teaching-programming.github.io/book/00-chapter-template.html), as it will appear in the published book. Quarto also provides more detailed [documentation about citations](https://quarto.org/docs/authoring/citations.html).

1. Create an empty file called `references.bib`, in the same folder as your Markdown chapter.
2. Find the data for each reference in your bibliography, in `.bib` format. There are several ways you can do this:
    - From Google Scholar: click Cite, then BibTeX at the bottom.
    - Directly from the publisher pages: find the option to export the citation, and select the BibTeX format.
    - All reference manager software should give you the option to export one or more references in BibTeX format.
3. Some of these will give you the text directly or copy it to your clipboard; others will give you a .bib file, which you can open in a plain text editor. In any case, paste the contents in your `references.bib` file. Be careful to paste the curly brackets correctly!
4. In your Markdown `.md` file, use `[@banana]` in the text wherever you want to cite the work corresponding to the `banana` entry in `references.bib`.

This is all you need to do; your references will be formatted automatically at the bottom of your chapter.

If you've never used BibTeX and this is confusing, the editing team will be able to do this on your behalf; in this case, please make sure that all of the references in your manuscript include a URL or DOI pointing to the publisher page, so that we can retrieve the citation data.

### References to websites

If you reference any website with a URL, insert the link in-line in the text, as is done throughout this document and in the [chapter template](https://teaching-programming.github.io/book/00-chapter-template.html).

### Format your footnotes

If you have added citations/references as footnotes, please reformat them as proper references instead (see [Format your references](#format-your-references)).

Footnotes can still be used for footnote text, as demonstrated [in the chapter template](00-chapter-template.qmd) (see the rendered footnotes [on the website](https://teaching-programming.github.io/book/00-chapter-template.html)). Please use `[^Cxx-your-footnote-tag]` for footnote tags, where `Cxx` is your chapter ID.

### Create 'inner links' pointing to another part of your own article {#inner-links}

To create a link to a header in your own chapter you need to do two things: give this header a unique id by putting `{#some-unique-id}` at the end of your header text. Then you link to it in a similar way to normal links, `[take me there](#some-unique-id)` - here's an [example link to this section](#inner-links)

## Submit your chapter to GitHub

### Fork the book repository (make your own copy) and add your chapter

1. When you have a final Markdown version of your chapter, choose one person with a GitHub account to submit it.
2. Fork the [book repository](https://github.com/teaching-programming/book) by clicking the "Fork" button on the top right of the screen. This creates your own copy of the book, associated with your GitHub account (the URL should be `github.com/your-github-username/book`, or another name if you chose a different one when creating your fork).
    - If you had already created your fork previously, and it is now "X commits behind", click "Sync fork", then "Update branch" to make sure your fork is still synchronised with the main book repo.

The following instructions explain how to edit the files directly in the browser, assuming little to no familiarity with GitHub. If you are comfortable enough using git and GitHub, you can just clone your fork locally, edit the files, and push your changes back to GitHub.

3. Find the `Cxx_chapter-title.qmd` file which corresponds to your chapter, click on the file, and edit it by clicking on the pencil icon on the top right.
    - Add your **chapter title** next to the `title:` in the header (in double quotes).
    - Add **author information** in the header under `author:`. You can add more authors by repeating the block starting with `- name:`, and delete the `email:` line if any authors don't want to share their email address.
    - Add **keywords** for you chapter under `keywords:`.
    - Delete the line indicated in the file, and copy and paste the **contents of your manuscript** `mychapter.md` in its place. Don't include the title, author information, or keywords, as you've already put these in the header.
    - Commit your changes.
4. Find the `references.bib` file on GitHub, and edit it.
    - Do not delete anything in the file!
    - Copy and paste the contents of your own `references.bib` file to the **end** of the `references.bib` file on GitHub, after all the other existing entries.
    - Commit your changes.
5. Find the `_quarto.yml` file on GitHub, and edit it.
    - Find the line starting with `#` and containing `Cxx_chapter-title.qmd` corresponding to your chapter.
    - Delete the `#` at the start of the line.
    - Commit your changes.
6. If you have images, find the `chapters/images/` folder, open it, and click "Add file" > "Upload files" on the top right of the screen to upload your image files.

### Optional: Preview your chapter

Optionally, if you have Quarto installed on your computer, you can render the book to preview your chapter and fix issues.

1. Download all the files in your fork. You can clone the repository, or just click on Code > Local > Download ZIP and extract the ZIP.
2. Render the book using Quarto:
    - If you use RStudio, add the `book` folder to your workspace, open `index.qmd`, and click the Render button (blue arrow).
    - If you use terminal commands, navigate to the main folder, and run `quarto render`.
3. When rendered, open `_book/Cxx_chapter-title.html` in a browser.

If you want to make any further changes then, don't forget to push or reupload them to your fork on GitHub when you are done.

### Merge your fork with the main book

Now, your fork of the book should contain your chapter; let's merge it back into the main book repo.

1. From your own fork, click on "Pull requests" at the top of the screen, then "New pull request".
2. Scroll down to double-check the changes you've made. The only 3 files which should have changes are:
    - `Cxx_chapter-title.qmd` which should now contain your chapter,
    - `references.bib` which should now contain your BibTeX references at the end of the file,
    - `_quarto.yml` which should have the `#` removed on the `Cxx_chapter-title.qmd` line.
3. Optionally, if you want to leave the editing team any comments or ask questions, you can do so in the text box.
4. Once you've checked that you are happy with your changes, click on "Create pull request".

The editing team will take it from here. We might need to make further changes and tweaks before we're able to merge your chapter and close the pull request; you will be able to see all of this by going back to view your pull request from the main book repository. If we need to ask you any questions, we will tag you so that you get notified by email, and you will be able to respond directly from the pull request page as well.


## Acknowledgements

Book template created by [Charlotte Desvages](https://github.com/chdesvages) and [Pawel Orzechowski](https://github.com/drpawelo) using [Quarto](https://quarto.org/), adapted from [chdesvages/quarto-display-settings](https://github.com/chdesvages/quarto-display-settings).
