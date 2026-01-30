# Teaching Programming Across Disciplines - Guidance for chapter authors

[Video instructions are available](https://media.ed.ac.uk/media//1_7nk68kt4) for chapter authors on how to submit your reviewed chapter to the GitHub repository. The slides shown in the video are also [available here](TODO: LINK TO SLIDES).

The main steps are also summarised below. **If you need assistance with any/all part(s) of the process, please contact [TODO: contact email?]().**


## Finalise your chapter

Before getting ready to publish, finalise all your edits and format your chapter following the [Book Submission Guidelines](https://docs.google.com/document/d/1Yui8fuxUEiMsIX2G-oKfUs3vObPXb2VzKi2CKvzAg3o/edit?tab=t.0), and incorporating feedback from reviewers. See the [example chapter](https://teaching-programming.github.io/book/C36_pair-programming-across-disciplines.html) for reference.


## Convert your chapter to Markdown

If you didn't write your chapter as a [Markdown file](https://www.markdownguide.org/basic-syntax/), you will first need to export or convert it to Markdown. You will obtain a Markdown file with the `.md` extension (we'll call it `mychapter.md` here). Markdown files can be edited in any plain text editor (e.g. Notepad, vim...), without the need for any particular software.

- If you use Google Docs, you can directly export Markdown by clicking on File > Download, then selecting Markdown.
- If you use other software, e.g. MS Word or LaTeX, you can try using [pandoc](https://pandoc.org/demos.html).


## Add captions and alt-text to your images

In the Markdown file, your images will look like this:

`![Your image caption](/path/to/yourimagefile.png)`

Change it to the following (note the change to the image file path):

`![Your image caption](/chapters/images/yourimagefile.png "Title, which will be displayed on mouse hover"){fig-alt="Some alt text which describes the image for screen reader users"}`


## Format your references

In the book, reference data is contained in a separate `.bib` file containing one entry for each cited work. The [chapter template](00-chapter-template.qmd) shows an example citation `@williams2010pair`, which creates an in-text tag, and automatically inserts a formatted citation at the end of the text, in the "References" section, by pulling the data from the entry in [`references.bib`](references.bib) corresponding to the `williams2010pair` tag (in this case, it's the first one in the file). You can see the result [on the website](https://teaching-programming.github.io/book/00-chapter-template.html), as it will appear in the published book. Quarto also provides more detailed [documentation about citations](https://quarto.org/docs/authoring/citations.html).

1. Create an empty file called `myrefs.bib`, in the same folder as your chapter.
2. Find the data for each reference in your bibliography, in `.bib` format. There are several ways you can do this:
    - From Google Scholar: click Cite, then BibTeX at the bottom.
    - Directly from the publisher pages: find the option to export the citation, and select the BibTeX format.
    - All reference manager software should give you the option to export one or more references in BibTeX format.
    - Some of these will give you the text directly or copy it to your clipboard; others will give you a .bib file, which you can open in a plain text editor. In any case, paste the contents in your `myrefs.bib` file. Be careful to paste the curly brackets correctly!
3. In your Markdown `.md` file, use `[@bibtex-tag]` in the text wherever you want to cite the work corresponding to the `bibtex-tag` entry in `myrefs.bib`.

This is all you need to do; your references will be formatted automatically at the bottom of your chapter.

[TODO: internal refs? do we do this ourselves?]

If this is extremely confusing, the editing team will be able to do this on your behalf; in this case, please make sure that all of the references in your manuscript include a URL or DOI pointing to the publisher page, so that we can retrieve the citation data.


## Submit your chapter to GitHub

1. When you have a final Markdown version of your chapter, choose one person with a GitHub account to submit it.
2. Fork the book repository by clicking the "Fork" button on the top right of the screen. This creates your own copy of the book, associated with your GitHub account (the URL should be `github.com/your-github-username/book`, or another name if you chose a different one when creating your fork).
3. Find the `Cxx_chapter-title.qmd` file which corresponds to your chapter, and [TODO: in browser? locally?]
4. Copy and paste the contents of your Markdown manuscript `mychapter.md` into the `.qmd` file, [TODO at the place indicated in the file]. Do not include the title!
5. Replace the `title:` in the header with the title of your chapter (in double quotes).
6. Copy and paste the contents of your `myrefs.bib` file to the **end** of the `references.bib` file, after all the other entries.
7. Commit your changes back to your GitHub repo. [TODO: push if you did it locally?]

[TODO: pull request instructions]


## Acknowledgements

Book template created by [Charlotte Desvages](https://github.com/chdesvages) and [Pawel Orzechowski](https://github.com/drpawelo) using [Quarto](https://quarto.org/), adapted from [chdesvages/quarto-display-settings](https://github.com/chdesvages/quarto-display-settings).
